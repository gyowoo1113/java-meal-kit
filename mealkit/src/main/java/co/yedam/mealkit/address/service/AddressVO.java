package co.yedam.mealkit.address.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AddressVO {

	private int addressId;
	private int addressZip;
	private String addressDetail;
	private String memberId;
	private String addressName;
}
