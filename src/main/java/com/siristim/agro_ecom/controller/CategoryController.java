package com.siristim.agro_ecom.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.siristim.agro_ecom.entity.Category;
import com.siristim.agro_ecom.service.CategoryService;

@Controller
public class CategoryController {
	
	// Alternate to @Autowired
	
	private CategoryService categoryService;
	
	public CategoryController(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	
	public void addEssentials(Model model, Principal principal) {
		model.addAttribute("title", "Category");
		model.addAttribute("username", principal.getName());
	}
	
	@GetMapping("/admin/category/add")
	public String addCategory(Model m, Principal p) {
		addEssentials(m, p);
		return "admin/category";
	}
	
	@PostMapping("/admin/category/save")
	public String saveCategory(@RequestParam("name") String name,
								@RequestParam String description, 
								@RequestParam int parentCategory) {
		Category cateogry = new Category(0, name, description, parentCategory, null);
		categoryService.addCategory(cateogry);
		return "redirect:/admin/category/add";
	}
	
	@GetMapping("/admin/category/show")
	public String showCategory(Model m, Principal p) {
		addEssentials(m, p);
		m.addAttribute("category_list", categoryService.getAllCategories());
		return "admin/category";
	}
	
	@GetMapping("/admin/category/edit/{id}")
	public String editCategory(@PathVariable("id") int cid, Model m, Principal p) {
		addEssentials(m,p);
		m.addAttribute("edit", true);
		m.addAttribute("edit_category", categoryService.getCategoryById(cid));
		m.addAttribute("category_list", categoryService.getAllCategories());
		return "admin/category";
	}
	
	@PostMapping("/admin/category/update")
	public String updateCateogry(@ModelAttribute  Category category) {
		categoryService.updateCategory(category);
		return "redirect:/admin/category/show#category_table";
	}
	
	@GetMapping("/admin/category/delete/{id}")
	public String deleteCategory(@PathVariable("id") int cid) {
		
	//	Category deleteCategory = categoryService.getCategoryById(cid); // deleting persistent object
		
		Category deleteCategory  = new Category();  // deleting transient object
		deleteCategory.setId(cid);
		
		categoryService.deleteCategory(deleteCategory);
		return "redirect:/admin/category/show#category_table";
	}
	

}
