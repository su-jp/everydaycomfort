package com.sujin.eComfort.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

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
public class Coupon {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;
	
	private String couponName;
	// 쿠폰사용 최소금액
	private int minAmount;
	// 할인율
	private double disAmount;
	// 최대 할인금액
	private int maxAmount;
	// 유효기간(일)
	private int validity;
	// 생성날짜
	@CreationTimestamp
	private Timestamp createDate;
}
