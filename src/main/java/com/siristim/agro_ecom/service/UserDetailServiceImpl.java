package com.siristim.agro_ecom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siristim.agro_ecom.entity.UserDetail;
import com.siristim.agro_ecom.repository.UserDetailDao;

@Service
@Transactional
public class UserDetailServiceImpl implements UserDetailService{
	
	@Autowired
	private UserDetailDao userDetailDao;

	@Override
	public void saveUser(UserDetail userDetail) {
		userDetailDao.save(userDetail);
	}

	@Override
	public List<UserDetail> getAllUsers() {
		
		return userDetailDao.findAll();
	}

	@Override
	public UserDetail getUserById(int id) {
		
		return userDetailDao.findById(id).get();
	}

	@Override
	public UserDetail getUserByUsername(String username) {
		
		return userDetailDao.findByUsername(username);
	}

}
