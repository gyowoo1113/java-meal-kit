package co.yedam.mealkit.order.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.mealkit.common.DataSource;
import co.yedam.mealkit.order.mapper.OrderMapper;
import co.yedam.mealkit.order.service.OrderService;
import co.yedam.mealkit.order.service.OrderVO;

public class OrderServiceImpl implements OrderService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	OrderMapper map = sqlSession.getMapper(OrderMapper.class);

	@Override
	public List<OrderVO> orderSelectList() {
		return map.orderSelectList();
	}

	@Override
	public OrderVO orderSelect(OrderVO vo) {
		return map.orderSelect(vo);
	}

	@Override
	public int orderInsert(OrderVO vo) {
		return map.orderInsert(vo);
	}

	@Override
	public int orderUpdate(OrderVO vo) {
		return map.orderUpdate(vo);
	}

	@Override
	public int orderDelete(OrderVO vo) {
		return map.orderDelete(vo);
	}

}
