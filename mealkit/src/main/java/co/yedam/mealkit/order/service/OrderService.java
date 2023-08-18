package co.yedam.mealkit.order.service;

import java.util.List;

public interface OrderService {
	List<OrderVO> orderSelectList();
	OrderVO orderSelect(OrderVO vo);
	int orderInsert(OrderVO vo);
	int orderUpdate(OrderVO vo);
	int orderDelete(OrderVO vo);
}
