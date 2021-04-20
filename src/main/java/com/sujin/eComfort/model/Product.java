package com.sujin.eComfort.model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class Product {
	private String productId;
	private String title;
	private String image;
	private Integer lprice;
}