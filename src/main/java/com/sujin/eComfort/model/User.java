package com.sujin.eComfort.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, length = 100, unique = true)
	private String email;
	
	@Column(nullable = false, length = 100)
	private String password;

	@Column(length = 50)
	private String name;
	
	private String phonenum;
	
	private String address;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"user"})
	@OrderBy("id asc")
	private List<Cart> carts;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"user"})
	@OrderBy("id asc")
	private List<Coupon> coupons;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"user"})
	@OrderBy("id asc")
	private List<PurchaseOrder> pos;
	
	private int point;
	
	private String role;
	
	private String oauth;
	
	@CreationTimestamp
	private Timestamp createDate;
}
