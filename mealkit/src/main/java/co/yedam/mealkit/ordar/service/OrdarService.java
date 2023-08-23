package co.yedam.mealkit.ordar.service;

import java.util.List;

public interface OrdarService {
	List<OrdarVO> ordarSelectList();
	OrdarVO ordarSelect(OrdarVO vo);
	int ordarInsert(OrdarVO vo);
	int ordarUpdate(OrdarVO vo);
	int ordarDelete(OrdarVO vo);
	int ordarIdMax();
}
