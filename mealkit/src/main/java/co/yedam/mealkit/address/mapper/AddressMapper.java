package co.yedam.mealkit.address.mapper;

import java.util.List;

import co.yedam.mealkit.address.service.AddressVO;

public interface AddressMapper {
	List<AddressVO>addressSelectList();
	List<AddressVO>addressSelectList(String memberId);
	AddressVO addressSelect(AddressVO vo);
	int addressInsert(AddressVO vo);
	int addressUpdate(AddressVO vo);
	int addressDelete(AddressVO vo);
}
