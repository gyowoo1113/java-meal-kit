package co.yedam.mealkit.stock.service;


import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StockVO {
	private String stockType;
	private LocalDate stockDate;
	private int productId;
	private int stockCount;
}
