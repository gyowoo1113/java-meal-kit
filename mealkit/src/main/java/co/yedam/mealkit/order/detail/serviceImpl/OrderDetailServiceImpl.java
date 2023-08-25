package co.yedam.mealkit.order.detail.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.mealkit.common.DataSource;
import co.yedam.mealkit.order.detail.mapper.OrderDetailMapper;
import co.yedam.mealkit.order.detail.service.OrderDetailService;
import co.yedam.mealkit.order.detail.service.OrderDetailVO;

public class OrderDetailServiceImpl implements OrderDetailService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	OrderDetailMapper map = sqlSession.getMapper(OrderDetailMapper.class);
	
	@Override
	public List<OrderDetailVO> orderDetailSelectList() {
		return map.orderDetailSelectList();
	}
	
	@Override
	public List<Map<String, Object>> orderDetailSelectListAll() {
		return map.orderDetailSelectListAll();
	}

	@Override
	public List<OrderDetailVO> orderDetailSelectList(String orderCode, int productId) {
		return map.orderDetailSelectList(orderCode, productId);
	}
	
	@Override
	public List<Map<String, Object>> orderDetailGroupList(List<Integer> ids) {
		return map.orderDetailGroupList(ids);
	}
	
	@Override
	public List<Map<String, Object>> orderDetailProductList(List<Integer> ids) {
		return map.orderDetailProductList(ids);
	}
	
	@Override
	public List<Map<String, Object>> orderDetailCountList() {
		return map.orderDetailCountList();
	}

	@Override
	public int orderDetailInsert(OrderDetailVO vo) {
		return map.orderDetailInsert(vo);
	}

	@Override
	public int orderDetailUpdate(OrderDetailVO vo) {
		return map.orderDetailUpdate(vo);
	}

	@Override
	public int orderDetailDelete(OrderDetailVO vo) {
		return map.orderDetailDelete(vo);
	}

}
