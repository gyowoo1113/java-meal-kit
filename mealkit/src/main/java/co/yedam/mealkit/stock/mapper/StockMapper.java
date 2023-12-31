package co.yedam.mealkit.stock.mapper;

import java.util.List;
import java.util.Map;

import co.yedam.mealkit.stock.service.StockVO;

public interface StockMapper {
	
	List<StockVO>stockSelectList();
	List<Map<String,Object>>stockSelectList(String stockType);
	StockVO stockSelect(StockVO vo);
	int insertStock(StockVO vo);
	int updateStock(StockVO vo);

}
