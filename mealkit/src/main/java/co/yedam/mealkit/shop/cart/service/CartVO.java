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
	
	public CartVO() {}
	public CartVO(int cartCount, String memberId, int productId) {
		super();
		this.cartCount = cartCount;
		this.memberId = memberId;
		this.productId = productId;
	}
	
	public CartVO(String memberId, int productId) {
		super();
		this.memberId = memberId;
		this.productId = productId;
	}
	
	public CartVO(int cartId, int cartCount) {
		super();
		this.cartId = cartId;
		this.cartCount = cartCount;
	}
}
