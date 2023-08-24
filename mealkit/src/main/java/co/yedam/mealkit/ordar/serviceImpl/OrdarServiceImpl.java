package co.yedam.mealkit.ordar.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.mealkit.common.DataSource;
import co.yedam.mealkit.ordar.mapper.OrdarMapper;
import co.yedam.mealkit.ordar.service.OrdarService;
import co.yedam.mealkit.ordar.service.OrdarVO;

public class OrdarServiceImpl implements OrdarService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	OrdarMapper map = sqlSession.getMapper(OrdarMapper.class);

	@Override
	public List<OrdarVO> ordarSelectList() {
		return map.ordarSelectList();
	}
	
	@Override
	public List<OrdarVO> ordarSelectList(String memberId) {
		return map.ordarSelectList(memberId);
	}
	
	@Override
	public OrdarVO ordarSelect(OrdarVO vo) {
		return map.ordarSelect(vo);
	}

	@Override
	public int ordarInsert(OrdarVO vo) {
		return map.ordarInsert(vo);
	}

	@Override
	public int ordarUpdate(OrdarVO vo) {
		return map.ordarUpdate(vo);
	}

	@Override
	public int ordarDelete(OrdarVO vo) {
		return map.ordarDelete(vo);
	}
	
	@Override
	public int ordarIdMax() {
		return map.ordarIdMax();
	}

}
