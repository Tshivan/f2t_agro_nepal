package com.siristim.agro_ecom.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.siristim.agro_ecom.entity.Cart;
import com.siristim.agro_ecom.entity.OrderDetail;
import com.siristim.agro_ecom.entity.OrderProduct;
import com.siristim.agro_ecom.entity.PaymentModel;
import com.siristim.agro_ecom.entity.UserDetail;
import com.siristim.agro_ecom.service.CartService;
import com.siristim.agro_ecom.service.OrderDetailService;
import com.siristim.agro_ecom.service.PaymentSecurityService;
import com.siristim.agro_ecom.service.UserDetailService;

@Controller
public class OrderController {

	@Autowired
	private UserDetailService userDetailService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private PaymentSecurityService paymentSecurityService;
	
	@GetMapping("/user/pay/cod")
	public String addCodOrder(Model model , Principal p) {
		UserDetail user = userDetailService.getUserByUsername(p.getName());
		List<Cart> cartList = cartService.getUserCart(user);
		model.addAttribute("cart_list", cartList);
		model.addAttribute("pdc", 100);
		return "cod";
	}
	
	@GetMapping("/user/pay/esewa")
	public String addEsewaOrder(Model model , Principal p) {
		List<Cart> cartList = cartService.getUserCart(userDetailService.getUserByUsername(p.getName()));
		double amount = 0;
		for(Cart cartItem : cartList) {
			amount += (cartItem.getProduct().getPerUnitPrice() - cartItem.getProduct().getDiscount())* cartItem.getQuantity();
		}
		PaymentModel payment = new PaymentModel();
		payment.setAmount(amount);
		payment.setTaxAmount(amount*0.13);
		payment.setPsc(100);
		payment.setPdc(100);
		payment.setTotalAmount(amount*1.13 + 100 + 100);
		String uuid = "AGRO-"+ (UUID.randomUUID().toString());
		payment.setTransactionUUID(uuid);
		payment.setProductCode("EPAYTEST");
		payment.setSuccessURL("http://localhost:9090/user/esewa/success/"+uuid);
		payment.setFailureURL("http://localhost:9090/user/esewa/failure/"+uuid);
		payment.setSignedFieldNames("total_amount,transaction_uuid,product_code");
		String secret_message = "total_amount="+payment.getTotalAmount()
								+",transaction_uuid="+payment.getTransactionUUID()
								+",product_code="+payment.getProductCode();
		// encode a secret message and sent it to the form to be send to esewa 		
		payment.setSignature(paymentSecurityService.encodeMessage(secret_message, "8gBm/:&EnhH.1/q"));
		model.addAttribute("payment" ,payment);
		return "esewa_payment";
	}
	
	@GetMapping("/user/order/save")
	public String saveOrder( Principal p)   {   // we now convert cart items into order product
		UserDetail user = userDetailService.getUserByUsername(p.getName());
		List<Cart> cartList = cartService.getUserCart(user);
		List<OrderProduct> orderedProducts = new ArrayList<OrderProduct>();
		OrderDetail orderDetail = new OrderDetail();
		double totalAmount = 0;
		for(Cart cartItem : cartList) {
			OrderProduct orderProduct = new OrderProduct();
			orderProduct.setProduct(cartItem.getProduct());
			orderProduct.setQuantity(cartItem.getQuantity());
			orderProduct.setOrderDetail(orderDetail);
			orderedProducts.add(orderProduct);
			totalAmount += (cartItem.getProduct().getPerUnitPrice() - cartItem.getProduct().getDiscount())* cartItem.getQuantity();
		}
		orderDetail.setOrderedProducts(orderedProducts);
		orderDetail.setDeliveryCharge(100);
		orderDetail.setBillAmount(totalAmount);
		orderDetail.setDeliveryDays(5);
		orderDetail.setOrderDate(LocalDate.now());
		orderDetail.setPaymentMode("COD");
		orderDetail.setStatus("PENDING");
		orderDetail.setServiceCharge(0);
		orderDetail.setSalesAmount(totalAmount);
		orderDetail.setUserDetail(user);
		// save user's order
		orderDetailService.saveOrder(orderDetail);
		// remove user's cart items
		cartService.deleteUserCart(user);
		return "redirect:/user/order/show";
	}
	
	@GetMapping("/user/order/show")
	public String showUsersOrders(Model model, Principal p) {
		UserDetail user = userDetailService.getUserByUsername(p.getName());
		List<OrderDetail> orderList = orderDetailService.getUsersOrders(user);
		model.addAttribute("order_list", orderList);
		return "order";
	}
	
	@GetMapping("/admin/order/show")
	public String showAllOrders(Model model, Principal p) {
		List<OrderDetail> orderList = orderDetailService.getAllOrders();
		model.addAttribute("order_list", orderList);
		return "admin/orders";
	}
	
	@GetMapping("/admin/order/update/{id}")
	public String updateOrder(@PathVariable int id, @RequestParam String status) {
		OrderDetail order = orderDetailService.getOrderbyId(id);
		order.setStatus(status);
		orderDetailService.updateOrder(order);
		return "redirect:/admin/order/show";
	}
	
	
	@GetMapping("/user/esewa/success/{uuid}")
	public String saveEsewaOrder(@PathVariable String uuid, Principal p) {
		UserDetail user = userDetailService.getUserByUsername(p.getName());
		List<Cart> cartList = cartService.getUserCart(user);
		List<OrderProduct> orderedProducts = new ArrayList<OrderProduct>();
		OrderDetail orderDetail = new OrderDetail();
		double totalAmount = 0;
		for(Cart cartItem : cartList) {
			OrderProduct orderProduct = new OrderProduct();
			orderProduct.setProduct(cartItem.getProduct());
			orderProduct.setQuantity(cartItem.getQuantity());
			orderProduct.setOrderDetail(orderDetail);
			orderedProducts.add(orderProduct);
			totalAmount += (cartItem.getProduct().getPerUnitPrice() - cartItem.getProduct().getDiscount())* cartItem.getQuantity();
		}
		orderDetail.setOrderedProducts(orderedProducts);
		orderDetail.setDeliveryCharge(100);
		orderDetail.setBillAmount(totalAmount);
		orderDetail.setDeliveryDays(5);
		orderDetail.setOrderDate(LocalDate.now());
		orderDetail.setPaymentMode("ESEWA_transaction_id="+uuid);
		orderDetail.setStatus("PENDING");
		orderDetail.setServiceCharge(100);
		orderDetail.setSalesAmount(totalAmount);
		orderDetail.setUserDetail(user);
		// save user's order
		orderDetailService.saveOrder(orderDetail);
		// remove user's cart items
		cartService.deleteUserCart(user);
		return "redirect:/user/order/show?esewa_order=success";
	}
}
