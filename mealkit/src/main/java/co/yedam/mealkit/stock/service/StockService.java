package co.yedam.mealkit.stock.service;

import java.util.List;
import java.util.Map;

public interface StockService {
	List<StockVO>stockSelectList();
	List<Map<String,Object>>stockSelectList(String stockType);
	StockVO stockSelect(StockVO vo);
	int insertStock(StockVO vo);
	int updateStock(StockVO vo);

}
