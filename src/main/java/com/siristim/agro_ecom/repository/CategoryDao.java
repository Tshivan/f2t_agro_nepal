package com.siristim.agro_ecom.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.siristim.agro_ecom.entity.Category;


@Repository
public interface CategoryDao extends JpaRepository<Category, Integer>{
	
	// basic implementation generated save, findAll, findById, update, delete
	
	// we can add specific method that will also be generated 
	
	public Category findByName(String name);
	
	

}
