package com.sujin.eComfort.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductSaveRequestDTO {
	private String productId;
	private String productTitle;
	private String productImage;
	private Integer productLprice;
	private int productQuantity;
}
