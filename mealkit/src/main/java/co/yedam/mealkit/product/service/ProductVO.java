package co.yedam.mealkit.product.service;

import java.time.LocalDate;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductVO {
	private int productID;
	private String productName;
	private int productPrice;
	private String productComment;
	private LocalDate productDate;
	private int categoryId;
	private String productImg;
	private int productStock;
}
