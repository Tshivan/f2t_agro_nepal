package com.siristim.agro_ecom.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.siristim.agro_ecom.entity.OrderDetail;
import com.siristim.agro_ecom.entity.UserDetail;

@Repository
public interface OrderDetailDao extends JpaRepository<OrderDetail, Integer>{

	public List<OrderDetail> findByUserDetail(UserDetail userDetail);
	
	public List<OrderDetail> findByPaymentMode(String paymentMode);
	
	public List<OrderDetail> findByStatus(String status);
	
	
}
