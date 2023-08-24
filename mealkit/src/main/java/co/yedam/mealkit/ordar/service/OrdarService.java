package co.yedam.mealkit.ordar.service;

import java.util.List;
import java.util.Map;

public interface OrdarService {
	List<OrdarVO> ordarSelectList();
	List<OrdarVO> ordarSelectList(String memberId);
	OrdarVO ordarSelect(OrdarVO vo);
	int ordarInsert(OrdarVO vo);
	int ordarUpdate(OrdarVO vo);
	int ordarDelete(OrdarVO vo);
	int ordarIdMax();
}
