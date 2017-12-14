package com.vitivinicola.proyecto.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vitivinicola.proyecto.model.ProductOrder;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	MailService mailService;

	@Override
	public void sendOrderConfirmation(ProductOrder productOrder) {
		mailService.sendEmail(productOrder);
	}

	@Override
	public void sendOrderConfirmationRegister(ProductOrder productOrder) {
		mailService.sendEmailRegister(productOrder);
		
	}
	@Override
	public void sendOrderConfirmationRegisterVinia(ProductOrder productOrder) {
		mailService.sendEmailRegisterVinia(productOrder);
		
	}
	@Override
	public void sendOrderConfirmationRegisterTI(ProductOrder productOrder) {
		mailService.sendEmailRegisterTI(productOrder);
		
	}
	@Override
	public void sendOrderConfirmationRegisterTIVinia(ProductOrder productOrder) {
		mailService.sendEmailRegisterTIVinia(productOrder);
		
	}
}
