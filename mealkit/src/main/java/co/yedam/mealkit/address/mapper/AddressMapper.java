package co.yedam.mealkit.address.mapper;

import java.util.List;

import co.yedam.mealkit.address.service.AddressVO;

public interface AddressMapper {
	List<AddressVO>addressSelectList();
	List<AddressVO>addressSelectList(String memberId);
	AddressVO addressSelect(AddressVO vo);
	int insertAddress(AddressVO vo);
	int updateAddress(AddressVO vo);
	int deleteAddress(AddressVO vo);

}
