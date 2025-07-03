package com.siristim.agro_ecom.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.siristim.agro_ecom.service.UserDetailService;

@Controller
public class UserController {

	@Autowired
	private UserDetailService userDetailService;
	
	
	@GetMapping("/user/profile")
	public String userHome(Model model, Principal p) {
		model.addAttribute("user", userDetailService.getUserByUsername(p.getName()));
		
		return "user";
	}
}
