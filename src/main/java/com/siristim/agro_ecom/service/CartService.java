package com.siristim.agro_ecom.service;

import java.util.List;

import com.siristim.agro_ecom.entity.Cart;
import com.siristim.agro_ecom.entity.UserDetail;

public interface CartService {

	
	public void saveCart(Cart cart);
	
	public Cart getCartById(int id);
	
	public List<Cart> getUserCart(UserDetail userDetail);
	
	public void updateCart(Cart cart);
	
	public void deleteCart(Cart cart);
	
	public void deleteUserCart(UserDetail userDetail);
	
}
