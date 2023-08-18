package co.yedam.mealkit.order.detail.mapper;

import java.util.List;

import co.yedam.mealkit.order.detail.service.OrderDetailVO;

public interface OrderDetailMapper {
	List<OrderDetailVO> orderDetailSelectList();
	List<OrderDetailVO> orderDetailSelectList(OrderDetailVO vo);
	int orderDetailInsert(OrderDetailVO vo);
	int orderDetailUpdate(OrderDetailVO vo);
	int orderDetailDelete(OrderDetailVO vo);
}
