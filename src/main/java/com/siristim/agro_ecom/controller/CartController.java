package com.siristim.agro_ecom.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.siristim.agro_ecom.entity.Cart;
import com.siristim.agro_ecom.entity.Product;
import com.siristim.agro_ecom.entity.UserDetail;
import com.siristim.agro_ecom.service.CartService;
import com.siristim.agro_ecom.service.ProductService;
import com.siristim.agro_ecom.service.UserDetailService;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserDetailService userDetailService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/user/cart/add/{pid}")
	public String addCart(Principal p, @PathVariable("pid") int id, @RequestParam int quantity) {
		Product product = productService.getProductById(id);
		UserDetail user = userDetailService.getUserByUsername(p.getName());
		Cart cart = new Cart();
		cart.setProduct(product);
		cart.setQuantity(quantity);
		cart.setAddedDate(LocalDate.now());
		cart.setUserDetail(user);
		cartService.saveCart(cart);
		return "redirect:/products";
	}
	
	@GetMapping("/user/cart/show")
	public String showCart(Principal p, Model model) {
		UserDetail user = userDetailService.getUserByUsername(p.getName());
		List<Cart> cartList = cartService.getUserCart(user);
		model.addAttribute("cart_list", cartList);
		return "cart";
	}

	@GetMapping("/user/cart/edit/{cid}")
	public String addCart(@PathVariable("cid") int id, @RequestParam int quantity) {
		Cart cart = cartService.getCartById(id);
		cart.setQuantity(quantity);
		cartService.updateCart(cart);
		return "redirect:/user/cart/show";
	}
	
	@GetMapping("/user/cart/delete/{cid}")
	public String deleteCart(@PathVariable("cid") int id) {
		Cart cart = cartService.getCartById(id);
		
		cartService.deleteCart(cart);
		return "redirect:/user/cart/show";
	}
	
	@GetMapping("/user/cart/clear")
	public String deleteAllUserCart(Principal p) {
		cartService.deleteUserCart(userDetailService.getUserByUsername(p.getName()));
		return "redirect:/user/cart/show";
	}
	
}
