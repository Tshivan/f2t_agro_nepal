package com.siristim.agro_ecom.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="user_role_tbl")
public class UserRole implements Serializable{

	private static final long serialVersionUID = 1387238L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="role_id")
	private int id;
	
	@Column(name="role")
	private String role;
	
	@OneToOne
	@JoinColumn(name="user_id")
	private UserDetail userDetail;

	public UserRole() {
		super();
	}

	public UserRole(int id, String role, UserDetail userDetail) {
		super();
		this.id = id;
		this.role = role;
		this.userDetail = userDetail;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public UserDetail getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}
	
	
	
	
}
