package co.yedam.mealkit.member.service;

import java.util.List;

public interface MemberService {
	
	
	List<MemberVO> memberSelectList();
	MemberVO memberSelect(MemberVO vo);
	MemberVO memberSelectVer2(MemberVO vo);
	MemberVO memberSearchPw(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberUpdateVer2(MemberVO vo);
	int memberUpdateVer3(MemberVO vo);
	int memberDelete(MemberVO vo);
}
