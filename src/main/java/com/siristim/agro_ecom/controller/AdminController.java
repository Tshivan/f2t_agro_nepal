package com.siristim.agro_ecom.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.siristim.agro_ecom.service.UserDetailService;

@Controller
public class AdminController {
	
	@Autowired
	private UserDetailService userDetailService;
	
	@GetMapping("/admin/dashboard")
	public String openDashboard(Principal p, Model model) {
		// Principal object stores a name of user from current session
		model.addAttribute("title", "Admin Dashbaord");
		model.addAttribute("username", p.getName());
		return "admin/dashboard";
	}

	
	@GetMapping("/admin/users/view")
	public String manageUser(Principal p, Model model) {
		model.addAttribute("title", "User Management");
		model.addAttribute("username", p.getName());
		model.addAttribute("user_list", userDetailService.getAllUsers());
		return "admin/users";
	}
	
	
}
