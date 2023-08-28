package co.yedam.mealkit.member.mapper;

import java.util.List;

import co.yedam.mealkit.member.service.MemberVO;

public interface MemberMapper {
	
	List<MemberVO> memberSelectList();
	MemberVO memberSelect(MemberVO vo);
	MemberVO memberViewPage(MemberVO vo);
	MemberVO memberSearchPw(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberGradeUpdate(MemberVO vo);
	int memberMypageUpdate(MemberVO vo);
	int memberDelete(MemberVO vo);
}
