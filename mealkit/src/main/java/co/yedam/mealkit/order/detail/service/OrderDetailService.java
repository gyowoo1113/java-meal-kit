package co.yedam.mealkit.order.detail.service;

import java.util.List;
import java.util.Map;

public interface OrderDetailService {
	List<OrderDetailVO> orderDetailSelectList();
	List<OrderDetailVO> orderDetailSelectList(String orderCode, int productId);
	List<Map<String, Object>> orderDetailGroupList(List<Integer> ids);
	List<Map<String, Object>> orderDetailProductList(List<Integer> ids);
	int orderDetailInsert(OrderDetailVO vo);
	int orderDetailUpdate(OrderDetailVO vo);
	int orderDetailDelete(OrderDetailVO vo);
}
