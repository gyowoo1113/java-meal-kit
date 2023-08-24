package co.yedam.mealkit.ordar.mapper;

import java.util.List;
import java.util.Map;

import co.yedam.mealkit.ordar.service.OrdarVO;

public interface OrdarMapper {
	List<OrdarVO> ordarSelectList();
	List<OrdarVO> ordarSelectList(String memberId);
	OrdarVO ordarSelect(OrdarVO vo);
	int ordarInsert(OrdarVO vo);
	int ordarUpdate(OrdarVO vo);
	int ordarDelete(OrdarVO vo);
	int ordarIdMax();
}
