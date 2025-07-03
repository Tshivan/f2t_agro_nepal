package com.siristim.agro_ecom.service;

import java.util.List;

import com.siristim.agro_ecom.entity.UserDetail;

public interface UserDetailService {
	
	public void saveUser(UserDetail userDetail);
	
	public List<UserDetail> getAllUsers();
	
	public UserDetail getUserById(int id);
	
	public UserDetail getUserByUsername(String username);

}
