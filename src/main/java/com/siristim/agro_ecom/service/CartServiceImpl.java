package com.siristim.agro_ecom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siristim.agro_ecom.entity.Cart;
import com.siristim.agro_ecom.entity.UserDetail;
import com.siristim.agro_ecom.repository.CartDao;


@Service
@Transactional
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDao cartDao;
	

	@Override
	public void saveCart(Cart cart) {
		cartDao.save(cart);
	}
	
	@Override
	public Cart getCartById(int id) {
		
		return cartDao.findById(id).get();
	}

	@Override
	public List<Cart> getUserCart(UserDetail userDetail) {
		
		return cartDao.findByUserDetail(userDetail);
	}

	@Override
	public void updateCart(Cart cart) {
		cartDao.save(cart);
	}

	@Override
	public void deleteCart(Cart cart) {
		cartDao.delete(cart);
	}

	@Override
	public void deleteUserCart(UserDetail userDetail) {
		cartDao.deleteByUserDetail(userDetail);
	}

}
