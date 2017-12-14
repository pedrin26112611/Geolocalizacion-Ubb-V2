package com.vitivinicola.proyecto.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.jdbc.datasource.UserCredentialsDataSourceAdapter;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.vitivinicola.proyecto.model.User;
import com.vitivinicola.proyecto.model.UserProfile;
import com.vitivinicola.proyecto.model.Vinias;
import com.vitivinicola.proyecto.service.OrderService;
import com.vitivinicola.proyecto.service.UserProfileService;
import com.vitivinicola.proyecto.service.UserService;
import com.vitivinicola.proyecto.service.ViniasService;
import com.ibm.icu.text.SimpleDateFormat;
import com.vitivinicola.proyecto.model.CustomerInfo;
import com.vitivinicola.proyecto.model.Muestra;
import com.vitivinicola.proyecto.model.ProductOrder;

@Controller
@Transactional
@RequestMapping("/")
@SessionAttributes("roles")
public class AppController {
	private static final String PATTERN_EMAIL = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

	double lati = -36.61;
	double longitud = -72.11;
	@Autowired
	UserService userService;

	@Autowired
	ViniasService viniasService;

	@Autowired
	UserProfileService userProfileService;

	@Autowired
	MessageSource messageSource;
	@Autowired
	OrderService orderService;
	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;

	@RequestMapping(value = { "/", "vistaHome" }, method = RequestMethod.GET)
	public String home(ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			List<Vinias> vinias = viniasService.findAllVinias();
			List<Muestra> muestras = new ArrayList<Muestra>();
			for(int index = 0 ; index < vinias.size() ; index ++) {
				if ( vinias.get(index).getAutorizar() == 0) {
					vinias.remove(index);
				}
				
			}
			for(int index = 0 ; index < vinias.size() ; index ++) {
				muestras.add(new Muestra(vinias.get(index).getId(),vinias.get(index).getName(),
						vinias.get(index).getRut(), vinias.get(index).getComuna(), vinias.get(index).getCiudad(),
						vinias.get(index).getDireccion(), vinias.get(index).getLatitud(),vinias.get(index).getLongitud(),
						vinias.get(index).getVariedad(),vinias.get(index).getDescripcion(), vinias.get(index).getEmail(),
						userService.findById(vinias.get(index).getCliente().getId()).getFirstName(),vinias.get(index).getFecha(),
						vinias.get(index).getAutorizar()));
				
			}
			model.addAttribute("list", muestras );
			return "home";
		} else {
			if (userService.findById(getIdPrincipalLogin()).getAutorizar() == 0) {
				return "accessDenied";
			} else {
				List<Vinias> vinias = viniasService.findAllVinias();
				List<Muestra> muestras = new ArrayList<Muestra>();
				for(int index = 0 ; index < vinias.size() ; index ++) {
					if ( vinias.get(index).getAutorizar() == 0) {
						vinias.remove(index);
					}
					
				}
				for(int index = 0 ; index < vinias.size() ; index ++) {
					muestras.add(new Muestra(vinias.get(index).getId(),vinias.get(index).getName(),
							vinias.get(index).getRut(), vinias.get(index).getComuna(), vinias.get(index).getCiudad(),
							vinias.get(index).getDireccion(), vinias.get(index).getLatitud(),vinias.get(index).getLongitud(),
							vinias.get(index).getVariedad(),vinias.get(index).getDescripcion(), vinias.get(index).getEmail(),
							userService.findById(vinias.get(index).getCliente().getId()).getFirstName(),vinias.get(index).getFecha(),
							vinias.get(index).getAutorizar()));
					
				}
				model.addAttribute("list", muestras );
				return "home";
			}
		}
	}

	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {
		if (userService.findById(getIdPrincipalLogin()).getAutorizar() == 0) {
			return "accessDenied";
		} else {
			List<User> users = userService.findAllUsers();
			List<User> usersAceptar = new ArrayList<User>();
			for (int index = 0; index < users.size(); index++) {
				if (users.get(index).getAutorizar() == 0) {
					
					usersAceptar.add(users.get(index));
					users.remove(index);
				}
			}
			model.addAttribute("users", users);
			model.addAttribute("userAceptar", usersAceptar);
			model.addAttribute("loggedinuser", getPrincipal());
			return "userslist";
		}
	}

	@RequestMapping(value = { "/newuser" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		model.addAttribute("loggedinuser", getPrincipal());
		return "registration";
	}

	@RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {

			if (user.getUserProfiles().isEmpty()) {

				user.getUserProfiles().add(new UserProfile(1, "USER"));
				if (!userService.isUserSSOUnique(user.getId(), user.getSsoId())) {
					FieldError ssoError = new FieldError("user", "ssoId", messageSource.getMessage("non.unique.ssoId",
							new String[] { user.getSsoId() }, Locale.getDefault()));
					result.addError(ssoError);
					return "registration";
				}
				/**
				 * if (!validateEmail(userService.findById(user.getId()).getEmail())) {
				 * FieldError ssoError = new FieldError("user", "ssoId",
				 * messageSource.getMessage("Pattern.user.email", new String[] { user.getEmail()
				 * }, Locale.getDefault())); result.addError(ssoError); return "registration"; }
				 */
				user.setAutorizar(0);
				user.setFecha(getFechaActual());
				userService.saveUser(user);
				orderService.sendOrderConfirmationRegister(getDummyOrder(user));
				model.addAttribute("edit", false);
				model.addAttribute("success",
						"Estimado Usuario " + user.getFirstName() + " Su Registro Fue Realizado Correctamente");
				model.addAttribute("loggedinuser", getPrincipal());

			}

			// userService.saveUser(user);

			return "registrationsuccess";
		}

		return "registrationsuccess";
	}

	@RequestMapping(value = { "edit-usuario" }, method = RequestMethod.GET)
	public String editUser(ModelMap model) {
		User user = userService.findBySSO(getPrincipal());

		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		model.addAttribute("loggedinuser", getPrincipal());
		return "registration";

	}

	@RequestMapping(value = { "agregar-user-{ssoId}" }, method = RequestMethod.GET)
	public String agregarUserCooperado(@PathVariable String ssoId, ModelMap model) {
		User user = userService.findBySSO(ssoId);
		user.setAutorizar(1);
		userService.updateUser(user);
		orderService.sendOrderConfirmationRegisterTI(getDummyOrder(user));
		model.addAttribute("edit", false);
		return "redirect:/list";

	}
	
	@RequestMapping(value = { "agregar-vinia-{id}" }, method = RequestMethod.GET)
	public String agregarAListaViña(@PathVariable int id, ModelMap model) {
		Vinias vinia = viniasService.findById(id);
		vinia.setAutorizar(1);
		orderService.sendOrderConfirmationRegisterTIVinia(getDummyOrder(userService.findById(vinia.getCliente().getId())));
		viniasService.updateVinia(vinia);
		
		return "redirect:/listViniasTotal";

	}
	@RequestMapping(value = { "visualizar-datos-{id}" }, method = RequestMethod.GET)
	public String vizualizarDatosProductor(@PathVariable int id, ModelMap model) {
		User user = userService.findById(id);
		model.addAttribute("user", user);
		
		return "viewInspeccionUsuario";

	}
	@RequestMapping(value = { "visualizar-datos-vinia-{id}" }, method = RequestMethod.GET)
	public String vizualizarDatosVinias(@PathVariable int id, ModelMap model) {
		Vinias vinia = viniasService.findById(id);
		model.addAttribute("vinia", vinia);
	
		return "viewInspeccion";

	}
	public static boolean validateEmail(String email) {
		Pattern pattern = Pattern.compile(PATTERN_EMAIL);
		Matcher matcher = pattern.matcher(email);
		return matcher.matches();
	}

	@RequestMapping(value = { "edit-usuario" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			if (user.getUserProfiles().isEmpty()) {
				model.addAttribute("edit", true);
				user.getUserProfiles().add(new UserProfile(1, "USER"));
				user.setRut(userService.findById(user.getId()).getRut());
				user.setSsoId(userService.findById(user.getId()).getSsoId());
				user.setAutorizar((userService.findById(user.getId()).getAutorizar()));
				System.out.println("El id del sami :" + user.getId());
				userService.updateUser(user);
				model.addAttribute("edit", false);
				model.addAttribute("success", "Estimado usuario  " + user.getFirstName() + " " + user.getLastName()
						+ " la actualizacion a finalizado correctamente");
				model.addAttribute("loggedinuser", getPrincipal());
			}
			return "registrationsuccess";
		}

		return "registrationsuccess";
	}

	@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String ssoId) {
		if (userService.findById(getIdPrincipalLogin()).getAutorizar() == 0) {
			return "accessDenied";
		} else {
			userService.deleteUserBySSO(ssoId);
			return "redirect:/list";
		}
	}
	@RequestMapping(value = { "/delete-cooperadoUser-admin-{ssoId}" }, method = RequestMethod.GET)
	public String deleteUserAdmin(@PathVariable String ssoId) {
	
			userService.deleteUserBySSO(ssoId);
			return "redirect:/list";
		
	}
	@RequestMapping(value = { "/delete-cooperado-admin-{id}" }, method = RequestMethod.GET)
	public String deleteViniaAdmin(@PathVariable int id) {
	
			viniasService.deleteVinia(id);
			return "redirect:/listViniasTotal";
		
	}
	@RequestMapping(value = { "/delete-vinia-{id}" }, method = RequestMethod.GET)
	public String deleteVinia(@PathVariable int id) {
		if (userService.findById(getIdPrincipalLogin()).getAutorizar() == 0) {
			return "accessDenied";
		} else {
			viniasService.deleteVinia(id);
			return "redirect:/listVinias";
		}
	}

	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("loggedinuser", getPrincipal());
		return "accessDenied";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(ModelMap model) {

		if (isCurrentAuthenticationAnonymous()) {
			model.addAttribute("edit", true);
			return "login";
		} else {

			return "redirect:/logout";
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			// new SecurityContextLogoutHandler().logout(request, response, auth);
			persistentTokenBasedRememberMeServices.logout(request, response, auth);
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		return "redirect:/login?logout";

	}

	@RequestMapping(value = { "/listVinias" }, method = RequestMethod.GET)
	public String listaDeVinias(ModelMap model) {
		if (userService.findById(getIdPrincipalLogin()).getAutorizar() == 0) {
			return "accessDenied";
		} else {
			int id;
			User user = userService.findById(getIdPrincipalLogin());
			id = user.getId();
			model.addAttribute("user", user);
			List<Vinias> documents = viniasService.findAllVinias();
			List<Vinias> viniasProductor = new ArrayList<Vinias>();
			for (int index = 0; index < documents.size(); index++) {
				if (documents.get(index).getCliente().getId() == id && documents.get(index).getAutorizar() == 1) {
					viniasProductor.add(documents.get(index));
				}
			}
			model.addAttribute("documents", viniasProductor);

			return "viniasList";
		}
	}

	@RequestMapping(value = { "/listViniasTotal" }, method = RequestMethod.GET)
	public String listViniasTotal(ModelMap model) {
		if (userService.findById(getIdPrincipalLogin()).getAutorizar() == 0) {
			return "accessDenied";
		} else {
			List<Vinias> listTotal = viniasService.findAllVinias();
			List<Vinias> listaMuestra = new ArrayList<Vinias>();
			List<Vinias> listaSinConfirmacion = new ArrayList<Vinias>() ;
			for (int index = 0 ; index < listTotal.size(); index ++) {
				if (listTotal.get(index).getAutorizar() == 0) {
					listaSinConfirmacion.add(listTotal.get(index));
				}
			}
			for (int index = 0 ; index < listTotal.size(); index ++) {
				if (listTotal.get(index).getAutorizar() == 1) {
					listaMuestra.add(listTotal.get(index));
				}
			}
			model.addAttribute("documents", listaMuestra);
			model.addAttribute("noConfirmada", listaSinConfirmacion);
			return "viniasList";
		}
	}

	@RequestMapping(value = { "/edit-vinias-{id}" }, method = RequestMethod.GET)
	public String editVinia(@PathVariable int id, ModelMap model) {
		if (userService.findById(getIdPrincipalLogin()).getAutorizar() == 0) {
			return "accessDenied";
		} else {
			Vinias vinia = viniasService.findById(id);
			model.addAttribute("vinias", vinia);
			model.addAttribute("edit", false);
			model.addAttribute("loggedinuser", getPrincipal());
			return "formVinias";
		}
	}

	@RequestMapping(value = { "/edit-vinias-{id}" }, method = RequestMethod.POST)
	public String updateVinia(@Valid Vinias vinia, BindingResult result, ModelMap model, @PathVariable int id) {
		if (userService.findById(getIdPrincipalLogin()).getAutorizar() == 0) {
			return "accessDenied";
		} else {
			if (result.hasErrors()) {
				vinia.setRut(viniasService.findById(id).getRut());
				vinia.setAutorizar(0);
				viniasService.updateVinia(vinia);
				orderService.sendOrderConfirmationRegisterVinia(getDummyOrder(userService.findById(viniasService.findById(id).getCliente().getId())));
				model.addAttribute("edit", false);
				model.addAttribute("success", "Estimado su viña con nombre " + vinia.getName() + " a sido actualizada");
				model.addAttribute("loggedinuser", getPrincipal());
				return "registrationsuccess";
			}

			return "registrationsuccess";
		}
	}

	@RequestMapping(value = { "/newVinias" }, method = RequestMethod.GET)
	public String newVinias(ModelMap model) {
		if (userService.findById(getIdPrincipalLogin()).getAutorizar() == 0) {
			return "accessDenied";
		} else {
			Vinias vinias = new Vinias();
			model.addAttribute("vinias", vinias);
			model.addAttribute("edit", true);
			model.addAttribute("loggedinuser", getPrincipal());
			return "formVinias";
		}
	}

	@RequestMapping(value = { "/busca-vinias-{id}" }, method = RequestMethod.GET)
	public String buscarVinia(@PathVariable int id, ModelMap model) {
		Vinias vinia = viniasService.findById(id);
		lati = vinia.getLatitud();
		longitud = vinia.getLongitud();
		model.addAttribute("vinia", vinia);
		return "viewVinia";
	}

	@ModelAttribute("lat")
	public double obtieneLatitud() {
		return lati;
	}

	@ModelAttribute("longitud")
	public double obtieneLong() {
		return longitud;
	}

	@RequestMapping(value = { "/newVinias" }, method = RequestMethod.POST)
	public String saveVinias(@Valid Vinias vinias, BindingResult result, ModelMap model) {
		if (userService.findById(getIdPrincipalLogin()).getAutorizar() == 0) {
			return "accessDenied";
		} else {
			if (result.hasErrors()) {
			
				System.out.println("Entre a registrar");
				User user = userService.findById(getIdPrincipalLogin());
				System.out.println("obtube el id " + getIdPrincipalLogin());
				Vinias viniasAux = vinias;
				System.out.println("obtuve la viña" + viniasAux.getName());
				// user.getListaVinias().add(viniasAux);
				viniasAux.setCliente(user);
				viniasAux.setAutorizar(0);
				viniasAux.setFecha(getFechaActual());
				orderService.sendOrderConfirmationRegisterVinia(getDummyOrder(user));
				model.addAttribute("edit", false);
				viniasService.saveVinia(viniasAux);
				model.addAttribute("success",
						"Estimado Usuario " + " Su Registro De viñas a sido agregada satisfactoreamente");
				return "redirect:/vistaHome";
			}
			
			

			return "redirect:/vistaHome";
		}
	}

	@ModelAttribute("IniClo")
	private boolean isCurrentAuthenticationAnonymous() {
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return authenticationTrustResolver.isAnonymous(authentication);
	}

	@RequestMapping(value = { "/reporte-vinias" }, method = RequestMethod.GET)
	public String reportesVinias(ModelMap model) {
		if (userService.findById(getIdPrincipalLogin()).getAutorizar() == 0) {
			return "accessDenied";
		} else {
			return "reportes";
		}
	}

	public static String getFechaActual() {
		Date ahora = new Date();
		SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");
		return formateador.format(ahora);
	}

	public static ProductOrder getDummyOrder(User user) {
		ProductOrder order = new ProductOrder();
		order.setOrderId("");
		order.setProductName("Se logro enviar ?");
		order.setStatus("confirmed");

		CustomerInfo customerInfo = new CustomerInfo();
		customerInfo.setName(user.getFirstName() + " " + user.getLastName());
		customerInfo.setAddress("WallStreet");
		customerInfo.setEmail(user.getEmail());
		order.setCustomerInfo(customerInfo);
		return order;
	}

	private int getIdPrincipalLogin() {
		int userid = 0;
		String userName = null;
		User usuario = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername().trim();
			usuario = userService.findBySSO(userName);
			userid = usuario.getId();
		} else {
			userName = principal.toString();
			usuario = userService.findBySSO(userName);
			userid = usuario.getId();
		}
		return userid;
	}

	private String getPrincipal() {
		String userName = null;

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	///////////////////////////////////////////////////////////////////
	////// TAREA DE REPORTES //////////////////////////////////////////
	///////////////////////////////////////////////////////////////////
	@ModelAttribute("mesDiciembre")
	public int obtenerDiciembre() {
		List<User> usuariosR = userService.findAllUsers();
		int count = 0;
		for ( int index = 0 ; index < usuariosR.size(); index ++ ) {
			if (usuariosR.get(index).getFecha().substring(5, 7).equalsIgnoreCase("12") && usuariosR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
	
		return count ;
		
	}
	@ModelAttribute("mesEnero")
	public int obtenerEnero() {
		List<User> usuariosR = userService.findAllUsers();
		int count = 0;
		for ( int index = 0 ; index < usuariosR.size(); index ++ ) {
			if (usuariosR.get(index).getFecha().substring(5, 7).equalsIgnoreCase("01") && usuariosR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
	
		return count ;
		
	}
	@ModelAttribute("mesFebrero")
	public int obtenerFebrero() {
		List<User> usuariosR = userService.findAllUsers();
		int count = 0;
		for ( int index = 0 ; index < usuariosR.size(); index ++ ) {
			if (usuariosR.get(index).getFecha().substring(5, 7).equalsIgnoreCase("02") && usuariosR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
	
		return count ;
		
	}
	@ModelAttribute("mesMarzo")
	public int obtenerMarzo() {
		List<User> usuariosR = userService.findAllUsers();
		int count = 0;
		for ( int index = 0 ; index < usuariosR.size(); index ++ ) {
			if (usuariosR.get(index).getFecha().substring(5, 7).equalsIgnoreCase("03") && usuariosR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
	
		return count ;
		
	}
	@ModelAttribute("mesAbril")
	public int obtenerAbril() {
		List<User> usuariosR = userService.findAllUsers();
		int count = 0;
		for ( int index = 0 ; index < usuariosR.size(); index ++ ) {
			if (usuariosR.get(index).getFecha().substring(5, 7).equalsIgnoreCase("04") && usuariosR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
	
		return count ;
		
	}
	@ModelAttribute("mesMayo")
	public int obtenerMayo() {
		List<User> usuariosR = userService.findAllUsers();
		int count = 0;
		for ( int index = 0 ; index < usuariosR.size(); index ++ ) {
			if (usuariosR.get(index).getFecha().substring(5, 7).equalsIgnoreCase("05") && usuariosR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
	
		return count ;
		
	}
	@ModelAttribute("mesJunio")
	public int obtenerJunio() {
		List<User> usuariosR = userService.findAllUsers();
		int count = 0;
		for ( int index = 0 ; index < usuariosR.size(); index ++ ) {
			if (usuariosR.get(index).getFecha().substring(5, 7).equalsIgnoreCase("06") && usuariosR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
	
		return count ;
		
	}
	@ModelAttribute("mesJulio")
	public int obtenerJulio() {
		List<User> usuariosR = userService.findAllUsers();
		int count = 0;
		for ( int index = 0 ; index < usuariosR.size(); index ++ ) {
			if (usuariosR.get(index).getFecha().substring(5, 7).equalsIgnoreCase("07") && usuariosR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
	
		return count ;
		
	}
	@ModelAttribute("mesAgosto")
	public int obtenerAgosto() {
		List<User> usuariosR = userService.findAllUsers();
		int count = 0;
		for ( int index = 0 ; index < usuariosR.size(); index ++ ) {
			if (usuariosR.get(index).getFecha().substring(5, 7).equalsIgnoreCase("08") && usuariosR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
	
		return count ;
		
	}
	@ModelAttribute("mesSeptiembre")
	public int obtenerSeptiembre() {
		List<User> usuariosR = userService.findAllUsers();
		int count = 0;
		for ( int index = 0 ; index < usuariosR.size(); index ++ ) {
			if (usuariosR.get(index).getFecha().substring(5, 7).equalsIgnoreCase("09") && usuariosR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
	
		return count ;
		
	}
	@ModelAttribute("mesOctubre")
	public int obtenerOctubre() {
		List<User> usuariosR = userService.findAllUsers();
		int count = 0;
		for ( int index = 0 ; index < usuariosR.size(); index ++ ) {
			if (usuariosR.get(index).getFecha().substring(5, 7).equalsIgnoreCase("10") && usuariosR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
	
		return count ;
		
	}
	@ModelAttribute("mesNoviembre")
	public int obtenerNoviembre() {
		List<User> usuariosR = userService.findAllUsers();
		int count = 0;
		for ( int index = 0 ; index < usuariosR.size(); index ++ ) {
			if (usuariosR.get(index).getFecha().substring(5, 7).equalsIgnoreCase("11") && usuariosR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
		return count ;	
	}
	@ModelAttribute("Cabernet")
	public int obtenerCabernet() {
		List<Vinias> viniaR = viniasService.findAllVinias();
		int count = 0;
		for ( int index = 0 ; index < viniaR.size(); index ++ ) {
			if (viniaR.get(index).getVariedad().equalsIgnoreCase("Cabernet sauvignon") && viniaR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
		return count ;	
	}
	@ModelAttribute("Chardonnay")
	public int obtenerChardonnay() {
		List<Vinias> viniaR = viniasService.findAllVinias();
		int count = 0;
		for ( int index = 0 ; index < viniaR.size(); index ++ ) {
			if (viniaR.get(index).getVariedad().equalsIgnoreCase("Chardonnay") && viniaR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
		return count ;	
	}
	@ModelAttribute("Merlot")
	public int obtenerMerlot() {
		List<Vinias> viniaR = viniasService.findAllVinias();
		int count = 0;
		for ( int index = 0 ; index < viniaR.size(); index ++ ) {
			if (viniaR.get(index).getVariedad().equalsIgnoreCase("Merlot") && viniaR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
		return count ;	
	}
	@ModelAttribute("SauvignonBlanc")
	public int obtenerSauvignonBlanc() {
		List<Vinias> viniaR = viniasService.findAllVinias();
		int count = 0;
		for ( int index = 0 ; index < viniaR.size(); index ++ ) {
			if (viniaR.get(index).getVariedad().equalsIgnoreCase("Sauvignon Blanc") && viniaR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
		return count ;	
	}
	@ModelAttribute("Carmenere")
	public int obtenerCarmenere() {
		List<Vinias> viniaR = viniasService.findAllVinias();
		int count = 0;
		for ( int index = 0 ; index < viniaR.size(); index ++ ) {
			if (viniaR.get(index).getVariedad().equalsIgnoreCase("Carménére") && viniaR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
		return count ;	
	}
	@ModelAttribute("Syrah-Shiraz")
	public int obtenerSyrahShiraz() {
		List<Vinias> viniaR = viniasService.findAllVinias();
		int count = 0;
		for ( int index = 0 ; index < viniaR.size(); index ++ ) {
			if (viniaR.get(index).getVariedad().equalsIgnoreCase("Syrah-Shiraz") && viniaR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
		return count ;	
	}
	@ModelAttribute("PinotNoir")
	public int obtenerPinotNoir() {
		List<Vinias> viniaR = viniasService.findAllVinias();
		int count = 0;
		for ( int index = 0 ; index < viniaR.size(); index ++ ) {
			if (viniaR.get(index).getVariedad().equalsIgnoreCase("Pinot Noir") && viniaR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
		return count ;	
	}
	@ModelAttribute("Malbec")
	public int obtenerMalbec() {
		List<Vinias> viniaR = viniasService.findAllVinias();
		int count = 0;
		for ( int index = 0 ; index < viniaR.size(); index ++ ) {
			if (viniaR.get(index).getVariedad().equalsIgnoreCase("Malbec") && viniaR.get(index).getAutorizar() == 1) {
				count ++;
			}
		}
		return count ;	
	}
}