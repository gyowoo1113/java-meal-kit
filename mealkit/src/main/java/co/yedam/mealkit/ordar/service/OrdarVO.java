package co.yedam.mealkit.ordar.service;


import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrdarVO {
	private int ordarId;
	private LocalDate ordarDate;
	private String shipCheck;
	private String memberId;
	private int addressId;
	private String ordarPayment;
	
	public OrdarVO() {}
	public OrdarVO(String memberId, int addressId) {
		super();
		this.memberId = memberId;
		this.addressId = addressId;
	}
}
