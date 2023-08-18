package co.yedam.mealkit.shop.cart.service;

import java.util.List;
import java.util.Map;

public interface CartService {
	List<Map<String,Object>> cartSelectList();
	List<Map<String,Object>> cartSelectList(String memberId);
	CartVO cartSelect(CartVO vo);
	int cartInsert(CartVO vo);
	int cartUpdate(CartVO vo);
	int cartDelete(CartVO vo);
}
