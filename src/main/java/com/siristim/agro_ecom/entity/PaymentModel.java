package com.siristim.agro_ecom.entity;

public class PaymentModel {
	
	private double amount;
	private double taxAmount;
	private double pdc;
	private double psc;
	private double totalAmount;
	private String transactionUUID;
	private String productCode;
	private String successURL;
	private String failureURL;
	private String signedFieldNames;
	private String signature;
	
	public PaymentModel() {
		super();
	}

	public PaymentModel(double amount, double taxAmount, double pdc, double psc, double totalAmount,
			String transactionUUID, String productCode, String successURL, String failureURL, String signedFieldNames,
			String signature) {
		super();
		this.amount = amount;
		this.taxAmount = taxAmount;
		this.pdc = pdc;
		this.psc = psc;
		this.totalAmount = totalAmount;
		this.transactionUUID = transactionUUID;
		this.productCode = productCode;
		this.successURL = successURL;
		this.failureURL = failureURL;
		this.signedFieldNames = signedFieldNames;
		this.signature = signature;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = Math.ceil(amount);
	}

	public double getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(double taxAmount) {
		this.taxAmount = Math.ceil(taxAmount);
	}

	public double getPdc() {
		return pdc;
	}

	public void setPdc(double pdc) {
		this.pdc = Math.ceil(pdc);
	}

	public double getPsc() {
		return psc;
	}

	public void setPsc(double psc) {
		this.psc = Math.ceil(psc);
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = Math.ceil(totalAmount);
	}

	public String getTransactionUUID() {
		return transactionUUID;
	}

	public void setTransactionUUID(String transactionUUID) {
		this.transactionUUID = transactionUUID;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getSuccessURL() {
		return successURL;
	}

	public void setSuccessURL(String successURL) {
		this.successURL = successURL;
	}

	public String getFailureURL() {
		return failureURL;
	}

	public void setFailureURL(String failureURL) {
		this.failureURL = failureURL;
	}

	public String getSignedFieldNames() {
		return signedFieldNames;
	}

	public void setSignedFieldNames(String signedFieldNames) {
		this.signedFieldNames = signedFieldNames;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}
	
	
}
