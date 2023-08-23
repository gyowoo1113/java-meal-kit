package co.yedam.mealkit.address.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.mealkit.address.mapper.AddressMapper;
import co.yedam.mealkit.address.service.AddressService;
import co.yedam.mealkit.address.service.AddressVO;
import co.yedam.mealkit.common.DataSource;

public class AddressServiceImple implements AddressService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private AddressMapper map = sqlSession.getMapper(AddressMapper.class);
	@Override
	public List<AddressVO> addressSelectList() {
		
		return map.addressSelectList();
	}

	@Override
	public List<AddressVO> addressSelectList(String memberId) {
		
		return map.addressSelectList(memberId);
	}
	
	@Override
	public AddressVO addressSelect(AddressVO vo) {
		
		return map.addressSelect(vo);
	}

	@Override
	public int insertAddress(AddressVO vo) {
		
		return map.insertAddress(vo);
	}

	@Override
	public int updateAddress(AddressVO vo) {
		
		return map.updateAddress(vo);
	}

	@Override
	public int deleteAddress(AddressVO vo) {
		
		return map.deleteAddress(vo);
	}

	
	
}
