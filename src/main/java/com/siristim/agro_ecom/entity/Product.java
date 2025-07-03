package com.siristim.agro_ecom.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name="product_table")
public class Product implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="product_id")
	private int id;
	@Column(name="name")
	private String name;
	@Column(name="description")
	private String description;
	@Column(name="per_unit_price")
	private double perUnitPrice;
	@Column(name="discount")
	private double discount;
	@Column(name="harvest_date")
	private LocalDate harvestDate;
	@Column(name="shelf_life")
	private int shelfLife;  // days to expire
	@Column(name="available_stock")
	private int availableStock;
	@Transient
	private MultipartFile image;
	@Column(name="image_name")
	private String imageName;
	@Column(name="farm_name")
	private String farmName;
	@Column(name="processing_method")
	private String processingMethod;
	@Column(name="seasonality")
	private String seasonality;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="category_id", nullable=false)
	private Category category;

	public Product() {
		super();
	}

	public Product(int id, String name, String description, double perUnitPrice, double discount, LocalDate harvestDate,
			int shelfLife, int availableStock, MultipartFile image, String imageName, String farmName,
			String processingMethod, String seasonality, Category category) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.perUnitPrice = perUnitPrice;
		this.discount = discount;
		this.harvestDate = harvestDate;
		this.shelfLife = shelfLife;
		this.availableStock = availableStock;
		this.image = image;
		this.imageName = imageName;
		this.farmName = farmName;
		this.processingMethod = processingMethod;
		this.seasonality = seasonality;
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPerUnitPrice() {
		return perUnitPrice;
	}

	public void setPerUnitPrice(double perUnitPrice) {
		this.perUnitPrice = perUnitPrice;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public LocalDate getHarvestDate() {
		return harvestDate;
	}

	public void setHarvestDate(LocalDate harvestDate) {
		this.harvestDate = harvestDate;
	}

	public int getShelfLife() {
		return shelfLife;
	}

	public void setShelfLife(int shelfLife) {
		this.shelfLife = shelfLife;
	}

	public int getAvailableStock() {
		return availableStock;
	}

	public void setAvailableStock(int availableStock) {
		this.availableStock = availableStock;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getFarmName() {
		return farmName;
	}

	public void setFarmName(String farmName) {
		this.farmName = farmName;
	}

	public String getProcessingMethod() {
		return processingMethod;
	}

	public void setProcessingMethod(String processingMethod) {
		this.processingMethod = processingMethod;
	}

	public String getSeasonality() {
		return seasonality;
	}

	public void setSeasonality(String seasonality) {
		this.seasonality = seasonality;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public int hashCode() {
		return Objects.hash(category, id, name, perUnitPrice, processingMethod);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		return Objects.equals(category, other.category) && id == other.id && Objects.equals(name, other.name)
				&& Double.doubleToLongBits(perUnitPrice) == Double.doubleToLongBits(other.perUnitPrice)
				&& Objects.equals(processingMethod, other.processingMethod);
	}
	
	

}
