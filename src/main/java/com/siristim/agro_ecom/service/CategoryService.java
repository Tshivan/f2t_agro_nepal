package com.siristim.agro_ecom.service;

import java.util.List;

import com.siristim.agro_ecom.entity.Category;

public interface CategoryService {
	
	public void addCategory(Category category);
	
	public List<Category> getAllCategories();
	
	public Category getCategoryById(int id);
	
	public Category getCategoryByName(String name);
	
	public void updateCategory(Category category);
	
	public void deleteCategory(Category category);

}
