package co.yedam.mealkit.stock.mapper;

import java.util.List;

import co.yedam.mealkit.stock.service.StockVO;

public interface StockMapper {
	
	List<StockVO>stockSelectList();
	StockVO stockSelect(StockVO vo);
	int insertStock(StockVO vo);
	int updateStock(StockVO vo);

}
