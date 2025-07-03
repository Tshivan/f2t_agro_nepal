package com.siristim.agro_ecom.service;

import java.util.List;

import com.siristim.agro_ecom.entity.Category;
import com.siristim.agro_ecom.entity.Product;

public interface ProductService {
	
	
	public Product saveProduct(Product product);
	
	public Product getProductById(int id);
	
	public List<Product> getAllProducts();
	
	public List<Product> getProductsByName(String name);
	
	public List<Product> getProductsByCateogry(Category category);
	
	public List<Product> getLessAvailableProducts(int quantity);
	
	public List<Product> getProductsByNameAndFarm(String name, String farmName);
	
	public Product updateProduct(Product product);
	
	public void deleteProduct(Product product);
	
	public void deleteProducts(List<Product> products);
	
}
