package com.siristim.agro_ecom.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siristim.agro_ecom.service.UserDetailService;

@Controller
@RequestMapping("/supplier")
public class SupplierController {
	
	@Autowired
	private UserDetailService userDetailService;
	
	@GetMapping("/home")
	public String supplierHome(Model model, Principal p) {
		model.addAttribute("user", userDetailService.getUserByUsername(p.getName()));
		return "supplier";
	}

}
