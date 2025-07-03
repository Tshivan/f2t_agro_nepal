package com.siristim.agro_ecom.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siristim.agro_ecom.entity.Category;
import com.siristim.agro_ecom.repository.CategoryDao;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryDao categoryDao;   // Dependency Injection

	@Override
	public void addCategory(Category category) {
		categoryDao.save(category);
	}

	@Override
	public List<Category> getAllCategories() {
		
		return categoryDao.findAll();
	}

	@Override
	public Category getCategoryById(int id) {
		Optional<Category> cat = categoryDao.findById(id);
		if(cat.isEmpty())
			throw new RuntimeException("Categroy not found for id: "+id);
		return cat.get();
	}

	@Override
	public Category getCategoryByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCategory(Category category) {
		categoryDao.save(category);
	}

	@Override
	public void deleteCategory(Category category) {
		categoryDao.delete(category);
	}

}
