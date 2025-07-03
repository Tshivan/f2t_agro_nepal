package com.siristim.agro_ecom.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.siristim.agro_ecom.entity.UserDetail;

@Repository
public interface UserDetailDao extends JpaRepository<UserDetail, Integer>{

	public UserDetail findByUsername(String username);
	
	public UserDetail findByEmail(String email);
	
	public UserDetail findByPhoneNo(String phoneNo);
	
	
}
