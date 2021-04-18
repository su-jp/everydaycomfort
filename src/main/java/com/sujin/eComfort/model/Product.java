package com.sujin.eComfort.model;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Product {
	private String productId;
	private String title;
	private String image;
	private Integer lprice;
}