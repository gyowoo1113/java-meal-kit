package co.yedam.mealkit.address.service;

import java.util.List;

public interface AddressService {
	List<AddressVO>addressSelectList();
	List<AddressVO>addressSelectList(String memberId);
	AddressVO addressSelect(AddressVO vo);
	int insertAddress(AddressVO vo);
	int updateAddress(AddressVO vo);
	int deleteAddress(AddressVO vo);
}
