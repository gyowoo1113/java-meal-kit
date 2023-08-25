package co.yedam.mealkit.order.detail.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.yedam.mealkit.order.detail.service.OrderDetailVO;

public interface OrderDetailMapper {
	List<OrderDetailVO> orderDetailSelectList();
	List<OrderDetailVO> orderDetailSelectList(@Param("orderCode") String orderCode,@Param("productId") int productId);
	List<Map<String, Object>> orderDetailGroupList(List<Integer> ids);
	List<Map<String, Object>> orderDetailProductList(List<Integer> ids);
	List<Map<String, Object>> orderDetailSelectListAll();
	List<Map<String, Object>> orderDetailCountList();
	int orderDetailInsert(OrderDetailVO vo);
	int orderDetailUpdate(OrderDetailVO vo);
	int orderDetailDelete(OrderDetailVO vo);
}
