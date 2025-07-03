package com.siristim.agro_ecom.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.siristim.agro_ecom.entity.Category;
import com.siristim.agro_ecom.entity.Product;

@Repository
public interface ProductDao extends JpaRepository<Product, Integer>{
	
	
	public List<Product> findByNameLike(String name);
	
	public List<Product> findByNameAndFarmName(String name, String farmName);
	
	public List<Product> findByAvailableStockLessThan(int availableStock);
	
	public List<Product> findByCategory(Category category);
	
}
