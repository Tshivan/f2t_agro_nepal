package com.siristim.agro_ecom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siristim.agro_ecom.entity.Category;
import com.siristim.agro_ecom.entity.Product;
import com.siristim.agro_ecom.repository.ProductDao;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Override
	public Product saveProduct(Product product) {
		
		return productDao.save(product);
	}


	@Override
	public Product getProductById(int id) {
		
		return productDao.findById(id).get();
	}

	@Override
	public List<Product> getAllProducts() {
		
		return productDao.findAll();
	}

	@Override
	public List<Product> getProductsByName(String name) {
		
		return  productDao.findByNameLike(name);
	}

	@Override
	public List<Product> getProductsByCateogry(Category category) {
		
		return  productDao.findByCategory(category);
	}

	@Override
	public List<Product> getLessAvailableProducts(int quantity) {
		
		return  productDao.findByAvailableStockLessThan(quantity);
	}

	@Override
	public List<Product> getProductsByNameAndFarm(String name, String farmName) {
		
		return  productDao.findByNameAndFarmName(name, farmName);
	}

	@Override
	public Product updateProduct(Product product) {
		
		return  productDao.save(product);
	}

	@Override
	public void deleteProduct(Product product) {
		 productDao.delete(product);
	}

	@Override
	public void deleteProducts(List<Product> products) {
		 productDao.deleteAll(products);
	}

}
