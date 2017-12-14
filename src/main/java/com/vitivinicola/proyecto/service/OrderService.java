package com.vitivinicola.proyecto.service;

import com.vitivinicola.proyecto.model.ProductOrder;

public interface OrderService {

	public void sendOrderConfirmation(ProductOrder productOrder);
	public void sendOrderConfirmationRegister(ProductOrder productOrder);
	public void sendOrderConfirmationRegisterVinia(ProductOrder productOrder);
	public void sendOrderConfirmationRegisterTI(ProductOrder productOrder);
	public void sendOrderConfirmationRegisterTIVinia(ProductOrder productOrder);
}
