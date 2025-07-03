package com.siristim.agro_ecom.service;

import java.util.List;

import com.siristim.agro_ecom.entity.OrderDetail;
import com.siristim.agro_ecom.entity.UserDetail;

public interface OrderDetailService {
	
	public void saveOrder(OrderDetail orderDetail);
	
	public List<OrderDetail> getAllOrders();
	
	public List<OrderDetail> getUsersOrders(UserDetail userDetail);
	
	public List<OrderDetail> getOrdersByStatus(String status);
	
	public List<OrderDetail> getOrdersByPaymentMode(String paymentMode);
	
	public OrderDetail getOrderbyId(int id);
	
	public void updateOrder(OrderDetail orderDetail);
	
	public void deleteOrder(OrderDetail orderDetail);

}
