package co.yedam.mealkit.shop.cart.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {
	private int cartId;
	private int cartCount;
	private String memberId;
	private int productId;
}
