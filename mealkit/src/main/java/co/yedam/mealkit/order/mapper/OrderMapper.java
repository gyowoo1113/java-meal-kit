package co.yedam.mealkit.order.mapper;

import java.util.List;

import co.yedam.mealkit.order.service.OrderVO;

public interface OrderMapper {
	List<OrderVO> orderSelectList();
	OrderVO orderSelect(OrderVO vo);
	int orderInsert(OrderVO vo);
	int orderUpdate(OrderVO vo);
	int orderDelete(OrderVO vo);
}
