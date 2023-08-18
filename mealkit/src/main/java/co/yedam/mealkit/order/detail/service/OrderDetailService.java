package co.yedam.mealkit.order.detail.service;

import java.util.List;

public interface OrderDetailService {
	List<OrderDetailVO> orderDetailSelectList();
	List<OrderDetailVO> orderDetailSelectList(String orderCode, int productId);
	int orderDetailInsert(OrderDetailVO vo);
	int orderDetailUpdate(OrderDetailVO vo);
	int orderDetailDelete(OrderDetailVO vo);
}
