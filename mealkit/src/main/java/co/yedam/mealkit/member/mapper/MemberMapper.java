package co.yedam.mealkit.member.mapper;

import java.util.List;

import co.yedam.mealkit.member.service.MemberVO;

public interface MemberMapper {
	
	List<MemberVO> memberSelectList();
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberUpdateVer2(MemberVO vo);
	int memberDelete(MemberVO vo);
}
