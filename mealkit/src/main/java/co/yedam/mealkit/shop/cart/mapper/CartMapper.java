package co.yedam.mealkit.shop.cart.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import co.yedam.mealkit.shop.cart.service.CartVO;

public interface CartMapper {
	List<Map<String,Object>> cartSelectList();
	List<Map<String,Object>> cartSelectList(String memberId);
	List<Map<String,Object>> cartSelectInList(List<Integer> array);
	CartVO cartSelect(CartVO vo);
	int cartInsert(CartVO vo);
	int cartUpdate(CartVO vo);
	int cartDelete(CartVO vo);
}
