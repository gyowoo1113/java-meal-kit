package co.yedam.mealkit.order.detail.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.mealkit.order.detail.service.OrderDetailVO;

public interface OrderDetailMapper {
	List<OrderDetailVO> orderDetailSelectList();
	List<OrderDetailVO> orderDetailSelectList(@Param("orderCode") String orderCode,@Param("productId") int productId);
	int orderDetailInsert(OrderDetailVO vo);
	int orderDetailUpdate(OrderDetailVO vo);
	int orderDetailDelete(OrderDetailVO vo);
}
