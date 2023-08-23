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
	
	public AddressVO() {}
	public AddressVO(int addressZip, String addressDetail, String memberId, String addressName) {
		super();
		this.addressZip = addressZip;
		this.addressDetail = addressDetail;
		this.memberId = memberId;
		this.addressName = addressName;
	}
}
