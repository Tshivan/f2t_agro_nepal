package com.siristim.agro_ecom.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.siristim.agro_ecom.entity.Product;
import com.siristim.agro_ecom.service.CategoryService;
import com.siristim.agro_ecom.service.ProductService;
import com.siristim.agro_ecom.service.UploadService;

@Controller
public class ProductController {

    private final CategoryController categoryController;
	
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private UploadService uploadService;
	
	@Autowired
	private ProductService productService;

    ProductController(CategoryController categoryController) {
        this.categoryController = categoryController;
    }
	
	@GetMapping("/admin/product/add")
	public String addProduct(Model m, Principal p) {
		addEssentials(m,p);
		m.addAttribute("category_list", categoryService.getAllCategories());
		return "admin/product";
	}
	
	@PostMapping("/admin/product/save")
	public String saveProduct(@ModelAttribute Product product) {
		// System.out.println("Product name: "+ product.getName());
		product.setImageName(product.getImage().getOriginalFilename());
		
		// upload Product Image
		if(!uploadService.uploadProductImage(product.getImage())) {
			return "redirect:/admin/product/add?image_upload_failed=true";
		}
		// image uploaded, now save product detail in the database
		Product p = productService.saveProduct(product);
		System.out.println("Product Saved: "+ p.getId());
		
		return "redirect:/admin/product/show#product_table";
	}

	@GetMapping("/admin/product/show")
	public String showProduct(Model m, Principal p) {
		addEssentials(m, p);
		m.addAttribute("category_list", categoryService.getAllCategories());
		m.addAttribute("product_list", productService.getAllProducts());
		
		return "admin/product";
	}
	

	public void addEssentials(Model model, Principal principal) {
		model.addAttribute("title", "Product");
		model.addAttribute("username", principal.getName());
	}
}
