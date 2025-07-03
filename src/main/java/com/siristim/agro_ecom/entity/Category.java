package com.siristim.agro_ecom.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="category_table")
public class Category implements Serializable{
	
	private static final long serialVersionUID = 23487328L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="category_id")
	private int id;
	@Column(name="category_name", unique=true)
	private String name;
	@Column(name="category_description")
	private String description;
	@Column(name="category_parent")
	private int categoryParent; 
	// identifies the parent category of this sub-category
	// if it has 0 then this is a main category i.e. it does not have any parent category
	
	@OneToMany(mappedBy="category")
	private List<Product> products;

	public Category() {
		super();
	}
	
	public Category(int id, String name, String description, int categoryParent, List<Product> products) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.categoryParent = categoryParent;
		this.products = products;
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

	public int getCategoryParent() {
		return categoryParent;
	}

	public void setCategoryParent(int categoryParent) {
		this.categoryParent = categoryParent;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public int hashCode() {
		return Objects.hash(categoryParent, id, name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Category other = (Category) obj;
		return categoryParent == other.categoryParent && id == other.id && Objects.equals(name, other.name);
	}
	
	

}
