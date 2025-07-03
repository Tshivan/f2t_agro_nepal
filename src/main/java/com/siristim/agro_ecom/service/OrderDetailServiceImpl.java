package com.siristim.agro_ecom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siristim.agro_ecom.entity.OrderDetail;
import com.siristim.agro_ecom.entity.UserDetail;
import com.siristim.agro_ecom.repository.OrderDetailDao;

@Service
@Transactional
public class OrderDetailServiceImpl implements OrderDetailService{

	@Autowired
	private OrderDetailDao orderDetailDao;
	
	@Override
	public void saveOrder(OrderDetail orderDetail) {
		 orderDetailDao.save(orderDetail);
	}

	@Override
	public List<OrderDetail> getAllOrders() {
		
		return  orderDetailDao.findAll();
	}

	@Override
	public List<OrderDetail> getUsersOrders(UserDetail usereDetail) {
		
		return  orderDetailDao.findByUserDetail(usereDetail);
	}

	@Override
	public List<OrderDetail> getOrdersByStatus(String status) {
		
		return  orderDetailDao.findByStatus(status);
	}

	@Override
	public List<OrderDetail> getOrdersByPaymentMode(String paymentMode) {
		
		return  orderDetailDao.findByPaymentMode(paymentMode);
	}

	@Override
	public OrderDetail getOrderbyId(int id) {
		
		return  orderDetailDao.findById(id).get();
	}

	@Override
	public void updateOrder(OrderDetail orderDetail) {
		 orderDetailDao.save(orderDetail);
	}

	@Override
	public void deleteOrder(OrderDetail orderDetail) {
		 orderDetailDao.delete(orderDetail);
	}

}
