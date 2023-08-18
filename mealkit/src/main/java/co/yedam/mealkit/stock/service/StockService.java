package co.yedam.mealkit.stock.service;

import java.util.List;

public interface StockService {
	List<StockVO>stockSelectList();
	StockVO stockSelect(StockVO vo);
	int insertStock(StockVO vo);
	int updateStock(StockVO vo);

}
