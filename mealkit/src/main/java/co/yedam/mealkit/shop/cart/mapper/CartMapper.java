package co.yedam.mealkit.shop.cart.mapper;

import java.util.List;

import co.yedam.mealkit.shop.cart.service.CartVO;

public interface CartMapper {
	List<CartVO> cartSelectList();
	List<CartVO> cartSelectList(String memberId);
	CartVO cartSelect(CartVO vo);
	int cartInsert(CartVO vo);
	int cartUpdate(CartVO vo);
	int cartDelete(CartVO vo);
}
