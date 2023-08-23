package co.yedam.mealkit.ordar.service;


import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrdarVO {
	private int orderId;
	private LocalDate orderDate;
	private String shipCheck;
	private String memberId;
	private int address_id;
	private String orderPayment;
}
