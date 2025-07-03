package com.siristim.agro_ecom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.siristim.agro_ecom.entity.UserDetail;
import com.siristim.agro_ecom.entity.UserRole;
import com.siristim.agro_ecom.service.ProductService;
import com.siristim.agro_ecom.service.UserDetailService;


@Controller
public class FrontController {

    private final CategoryController categoryController;
	// This creates a secondary controller
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserDetailService userDetailService;

    FrontController(CategoryController categoryController) {
        this.categoryController = categoryController;
    }
	
	@GetMapping({"/","/home", "/index"})
	public String openHome(Model model) {
		// return name of the view
		model.addAttribute("title", "Home");
		return "index";
	}

	@GetMapping("/about")
	public String openAbout(Model model) {
		model.addAttribute("title", "About");
		return "about";
	}
	
	@GetMapping("/products")
	public String skjdfshkjlsdmknj(Model model) {
		model.addAttribute("product_list", productService.getAllProducts());
		return "products";
	}
	
	@GetMapping("/services")
	public String openServces() {
		return "services";
	}
	
	@GetMapping("/contact")
	public String openContact() {
		return "contact";
	}
	
	
	@GetMapping("/signup")
	public String userResitration() {
		
		return "signup";
	}
	
	@PostMapping("/signup")
	public String registerUser(@ModelAttribute UserDetail userDetail) {
		if(!userDetail.getPassword().equals(userDetail.getCpassword())) {
			return "redirect:/signup?password_mismatch=true";
		}
		userDetail.setPassword(passwordEncoder.encode(userDetail.getPassword()));
		userDetail.setCpassword("");
		UserRole userRole = new UserRole();
		String authority = userDetail.getAuthority();
		userRole.setRole(authority);
		if(authority.equals("ROLE_ADMIN")) {
			userDetail.setEnable("0"); 
			// admin is deactivated when registered, and varied later
		}else {
			userDetail.setEnable("1"); 
		}
		//make relational bidirectional
		userRole.setUserDetail(userDetail);
		userDetail.setUserRole(userRole);
		// save user detail which in turn also saves user role
		
		userDetailService.saveUser(userDetail);
		return "redirect:/login";
	}
	
	@GetMapping("/welcome")
	public String welcome(Authentication auth) {
		String authority = auth.getAuthorities().toString();
		System.out.println(authority);
		if(authority.contains("ADMIN")) {
			return "redirect:/admin/dashboard";
		}
		if(authority.contains("VENDER")){
			return "redirect:/supplier/home";
		}
		if(authority.contains("USER")){
			return "redirect:/user/profile";
		}
			return "redirect:/home";
	}
	
	
	
}
