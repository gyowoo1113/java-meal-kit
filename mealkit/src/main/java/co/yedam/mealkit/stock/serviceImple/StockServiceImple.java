package co.yedam.mealkit.stock.serviceImple;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.mealkit.common.DataSource;
import co.yedam.mealkit.stock.mapper.StockMapper;
import co.yedam.mealkit.stock.service.StockService;
import co.yedam.mealkit.stock.service.StockVO;

public class StockServiceImple implements StockService {
	
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private StockMapper map = sqlSession.getMapper(StockMapper.class);

	@Override
	public List<StockVO> stockSelectList() {
		
		return map.stockSelectList();
	}

	@Override
	public StockVO stockSelect(StockVO vo) {
		
		return map.stockSelect(vo);
	}

	@Override
	public int insertStock(StockVO vo) {
	
		return map.insertStock(vo);
	}

	@Override
	public int updateStock(StockVO vo) {
	
		return map.updateStock(vo);
	}

	@Override
	public List<Map<String, Object>> stockSelectList(String stockType) {
		
		return map.stockSelectList(stockType);
	}

}
