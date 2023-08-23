package co.yedam.mealkit.address.service;

import java.util.List;

public interface AddressService {
	List<AddressVO>addressSelectList();
	List<AddressVO>addressSelectList(String memberId);
	AddressVO addressSelect(AddressVO vo);
	int addressInsert(AddressVO vo);
	int addressUpdate(AddressVO vo);
	int addressDelete(AddressVO vo);
}
