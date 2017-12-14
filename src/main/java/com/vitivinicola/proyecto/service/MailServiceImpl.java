package com.vitivinicola.proyecto.service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.vitivinicola.proyecto.model.ProductOrder;

@Service("mailService")
public class MailServiceImpl implements MailService {

	@Autowired
	JavaMailSender mailSender;

	@Override
	public void sendEmail(Object object) {

		ProductOrder order = (ProductOrder) object;

		MimeMessagePreparator preparator = getMessagePreparator(order);
		
		try {
			mailSender.send(preparator);
			System.out.println("Email Enviado Correctamente !!!");
		} catch (MailException ex) {
			System.err.println(ex.getMessage());
		}
	}
	@Override
	public void sendEmailRegister(Object object) {
		ProductOrder order = (ProductOrder) object;

		MimeMessagePreparator preparator = getMessagePreparatorRegister(order);
		
		try {
			mailSender.send(preparator);
			System.out.println("Email Enviado Correctamente !!!");
		} catch (MailException ex) {
			System.err.println(ex.getMessage());
		}
		
	}
	@Override
	public void sendEmailRegisterVinia(Object object) {
		ProductOrder order = (ProductOrder) object;

		MimeMessagePreparator preparator = getMessagePreparatorRegisterVinias(order);
		
		try {
			mailSender.send(preparator);
			System.out.println("Email Enviado Correctamente !!!");
		} catch (MailException ex) {
			System.err.println(ex.getMessage());
		}
		
	}
	@Override
	public void sendEmailRegisterTI(Object object) {
		ProductOrder order = (ProductOrder) object;

		MimeMessagePreparator preparator = getMessagePreparatorRegisterTI(order);
		
		try {
			mailSender.send(preparator);
			System.out.println("Email Enviado Correctamente !!!");
		} catch (MailException ex) {
			System.err.println(ex.getMessage());
		}
		
	}
	@Override
	public void sendEmailRegisterTIVinia(Object object) {
		ProductOrder order = (ProductOrder) object;

		MimeMessagePreparator preparator = getMessagePreparatorRegisterTIVinia(order);
		
		try {
			mailSender.send(preparator);
			System.out.println("Email Enviado Correctamente !!!");
		} catch (MailException ex) {
			System.err.println(ex.getMessage());
		}
		
	}
	
	private MimeMessagePreparator getMessagePreparator(final ProductOrder order) {

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);
				message.setFrom("customerserivces@yourshop.com");
				mimeMessage.setRecipient(Message.RecipientType.TO,
						new InternetAddress(order.getCustomerInfo().getEmail()));
				message.setText("Estimado " + order.getCustomerInfo().getName()
						+ "su codigo de reserva es: " + order.getOrderId() + ".");
				mimeMessage.setSubject("Confirmacion de reserva");
		
				//message.addAttachment("Reserva", file);
			}
		};
		return preparator;
	}

	private MimeMessagePreparator getMessagePreparatorRegister(final ProductOrder order) {

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);
				message.setFrom("customerserivces@yourshop.com");
				mimeMessage.setRecipient(Message.RecipientType.TO,
						new InternetAddress(order.getCustomerInfo().getEmail()));
				message.setText("Estimad@ " + order.getCustomerInfo().getName()+":"
						+"\n"+"Su registro al sistema fue exitoso, confirmaremos tus datos y a la brevedad te enviaremos un e-mail validando tu cuenta para que puedas gozar de los beneficios de usuario cooperado en nuestra p�gina.\n" + 
						"Gracias por unirte a nuestro sitio de geolocalizaci�n de productores de vi�as. "
						+"\n\n\n"+"Cooperativa El Origen");
				mimeMessage.setSubject("Confirmacion De Registro");
				//message.addAttachment("Codigo-Reserva.png", new ClassPathResource("Codigo-Reserva.png"));
			
			}
		};
		return preparator;
	}
	private MimeMessagePreparator getMessagePreparatorRegisterTI(final ProductOrder order) {

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);
				message.setFrom("customerserivces@yourshop.com");
				mimeMessage.setRecipient(Message.RecipientType.TO,
						new InternetAddress(order.getCustomerInfo().getEmail()));
				message.setText("Estimad@ usuario " + order.getCustomerInfo().getName()+":"
						+"\n"+"Sus datos de registro han sido validados. Ahora ya puede ingresar a nuestra p�gina como usuario cooperado en cualquier momento y gestionar sus vi�as, adem�s de conocer el control de estad�sticas que lleva nuestro sitio para los fines que estime convenientes. Bienvenido a nuestra cooperativa"
						+"\n\n\n"+"Cooperativa El Origen");
				mimeMessage.setSubject("Confirmacion De Cuenta");
				//message.addAttachment("Codigo-Reserva.png", new ClassPathResource("Codigo-Reserva.png"));
			
			}
		};
		return preparator;
	}
	// arreglar
	private MimeMessagePreparator getMessagePreparatorRegisterTIVinia(final ProductOrder order) {

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);
				message.setFrom("customerserivces@yourshop.com");
				mimeMessage.setRecipient(Message.RecipientType.TO,
						new InternetAddress(order.getCustomerInfo().getEmail()));
				message.setText("Estimad@ usuario " + order.getCustomerInfo().getName()+":"
						+"\n"+"Se han confirmado los cambios que ha realizado sobre sus vi�as y ya est� disponible la nueva informaci�n sobre �stas en la p�gina. Esperamos que tenga un buen d�a"
						+"\n\n\n"+"Cooperativa El Origen");
				mimeMessage.setSubject("Confirmacion Vi�as");
				//message.addAttachment("Codigo-Reserva.png", new ClassPathResource("Codigo-Reserva.png"));
			
			}
		};
		return preparator;
	}
	private MimeMessagePreparator getMessagePreparatorRegisterVinias(final ProductOrder order) {

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);
				message.setFrom("customerserivces@yourshop.com");
				mimeMessage.setRecipient(Message.RecipientType.TO,
						new InternetAddress(order.getCustomerInfo().getEmail()));
				message.setText("Estimad@ usuario: " + order.getCustomerInfo().getName()+":"
						+"\n"+"Hemos recibido modificaciones en una de las vi�as a su nombre, confirmaremos los cambios realizados a la brevedad para actualizar su conjunto de vi�as en la p�gina una vez que estos cambios sean validados. Como siempre gracias por preferirnos."
						+"\n\n\n"+"Cooperativa El Origen");
				mimeMessage.setSubject("Confirmacion Registro de Vi�a");
				//message.addAttachment("Codigo-Reserva.png", new ClassPathResource("Codigo-Reserva.png"));
			
			}
		};
		return preparator;
	}

}
