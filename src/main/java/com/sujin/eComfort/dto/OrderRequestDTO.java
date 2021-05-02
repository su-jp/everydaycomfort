package com.sujin.eComfort.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderRequestDTO {
	private int totalAmount;
	private String payment;
	private String payInfo;
	private String couponId;
	private int point;
	private int couponAmount;
}
