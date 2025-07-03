package com.siristim.agro_ecom.service;

public interface PaymentSecurityService {
	
	public String encodeMessage(String message, String key);
	

}
