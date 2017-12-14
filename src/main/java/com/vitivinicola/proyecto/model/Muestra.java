package com.vitivinicola.proyecto.model;

public class Muestra {

	private int id;
	private String name;
	private String rut ;
	private String comuna;
	private String ciudad;
	private String direccion;
	private Double latitud;
	private Double longitud;
	private String variedad;
	private String descripcion;
	private String email;
    private User cliente;
    private String muestraCliente;
	private String fecha ;
	private int autorizar ;
	
	public Muestra() {}
	
	public Muestra(int id, String name, String rut, String comuna, String ciudad, String direccion, Double latitud,
			Double longitud, String variedad, String descripcion, String email, String muestraCliente, String fecha,
			int autorizar) {
		super();
		this.id = id;
		this.name = name;
		this.rut = rut;
		this.comuna = comuna;
		this.ciudad = ciudad;
		this.direccion = direccion;
		this.latitud = latitud;
		this.longitud = longitud;
		this.variedad = variedad;
		this.descripcion = descripcion;
		this.email = email;
		this.muestraCliente = muestraCliente;
		this.fecha = fecha;
		this.autorizar = autorizar;
	}

	public User getCliente() {
		return cliente;
	}

	public String getMuestraCliente() {
		return muestraCliente;
	}

	public void setMuestraCliente(String muestraCliente) {
		this.muestraCliente = muestraCliente;
	}

	public void setCliente(User cliente) {
		this.cliente = cliente;
	}
	
	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public int getAutorizar() {
		return autorizar;
	}

	public void setAutorizar(int autorizar) {
		this.autorizar = autorizar;
	}

	public int getId() {
		return id;
	}
	

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRut() {
		return rut;
	}

	public void setRut(String rut) {
		this.rut = rut;
	}

	public String getComuna() {
		return comuna;
	}

	public void setComuna(String comuna) {
		this.comuna = comuna;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Double getLatitud() {
		return latitud;
	}

	public void setLatitud(Double latitud) {
		this.latitud = latitud;
	}

	public Double getLongitud() {
		return longitud;
	}

	public void setLongitud(Double longitud) {
		this.longitud = longitud;
	}

	public String getVariedad() {
		return variedad;
	}

	public void setVariedad(String variedad) {
		this.variedad = variedad;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
/*
	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
*/
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	

}