package co.yedam.mealkit.shop.cart.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.mealkit.common.DataSource;
import co.yedam.mealkit.shop.cart.mapper.CartMapper;
import co.yedam.mealkit.shop.cart.service.CartService;
import co.yedam.mealkit.shop.cart.service.CartVO;

public class CartServiceImpl implements CartService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	CartMapper map = sqlSession.getMapper(CartMapper.class);
	
	@Override
	public List<CartVO> cartSelectList() {
		return map.cartSelectList();
	}

	@Override
	public List<CartVO> cartSelectList(String memberId) {
		return map.cartSelectList(memberId);
	}

	@Override
	public CartVO cartSelect(CartVO vo) {
		return map.cartSelect(vo);
	}

	@Override
	public int cartInsert(CartVO vo) {
		return map.cartInsert(vo);
	}

	@Override
	public int cartUpdate(CartVO vo) {
		return map.cartUpdate(vo);
	}

	@Override
	public int cartDelete(CartVO vo) {
		return map.cartDelete(vo);
	}

}