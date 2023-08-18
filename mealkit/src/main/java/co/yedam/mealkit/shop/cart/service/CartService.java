package co.yedam.mealkit.shop.cart.service;

import java.util.List;

public interface CartService {
	List<CartVO> cartSelectList();
	List<CartVO> cartSelectList(String memberId);
	CartVO cartSelect(CartVO vo);
	int cartInsert(CartVO vo);
	int cartUpdate(CartVO vo);
	int cartDelete(CartVO vo);
}
