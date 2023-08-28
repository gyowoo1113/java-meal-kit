package co.yedam.mealkit.member.service;

import java.util.List;

public interface MemberService {
	
	
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
