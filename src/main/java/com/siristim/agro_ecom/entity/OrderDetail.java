package com.siristim.agro_ecom.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name="order_table")
public class OrderDetail implements Serializable{
	
	private static final long serialVersionUID = 237482L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="order_id")
	private int id;
	
	@OneToMany(mappedBy="orderDetail", cascade=CascadeType.ALL)
	private List<OrderProduct> orderedProducts;
	
	@Column(name="sales_amount")
	private double salesAmount;
	
	@Column(name="order_date")
	private LocalDate orderDate;
	
	@Column(name="delivery_days")
	private int deliveryDays;
	
	@Column(name="delivery_charge")
	private double deliveryCharge;
	@Column(name="tax_amount")
	private double taxAmount;
	@Column(name="service_charge")
	private double serviceCharge;
	
	@Transient
	private double billAmount;
	@Column(name="payment_mode")
	private String paymentMode;
	
	private String status;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private UserDetail userDetail;

	public OrderDetail() {
		super();
	}

	public OrderDetail(int id, List<OrderProduct> orderedProducts, double salesAmount, LocalDate orderDate,
			int deliveryDays, double deliveryCharge, double taxAmount, double serviceCharge, double billAmount,
			String paymentMode, String status, UserDetail userDetail) {
		super();
		this.id = id;
		this.orderedProducts = orderedProducts;
		this.salesAmount = salesAmount;
		this.orderDate = orderDate;
		this.deliveryDays = deliveryDays;
		this.deliveryCharge = deliveryCharge;
		this.taxAmount = taxAmount;
		this.serviceCharge = serviceCharge;
		this.billAmount = billAmount;
		this.paymentMode = paymentMode;
		this.status = status;
		this.userDetail = userDetail;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<OrderProduct> getOrderedProducts() {
		return orderedProducts;
	}

	public void setOrderedProducts(List<OrderProduct> orderedProducts) {
		this.orderedProducts = orderedProducts;
	}

	public double getSalesAmount() {
		return salesAmount;
	}

	public void setSalesAmount(double salesAmount) {
		this.salesAmount = salesAmount;
	}

	public LocalDate getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}

	public int getDeliveryDays() {
		return deliveryDays;
	}

	public void setDeliveryDays(int deliveryDays) {
		this.deliveryDays = deliveryDays;
	}

	public double getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(double deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public double getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(double taxAmount) {
		this.taxAmount = taxAmount;
	}

	public double getServiceCharge() {
		return serviceCharge;
	}

	public void setServiceCharge(double serviceCharge) {
		this.serviceCharge = serviceCharge;
	}

	public double getBillAmount() {
		return billAmount;
	}

	public void setBillAmount(double billAmount) {
		this.billAmount = billAmount;
	}

	public String getPaymentMode() {
		int endIndex = paymentMode.length();
		if(paymentMode.contains("_")) {
			endIndex = paymentMode.indexOf("_");
		}
		String paymode = paymentMode.substring(0, endIndex);
		return paymode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public UserDetail getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}
	
	

}
