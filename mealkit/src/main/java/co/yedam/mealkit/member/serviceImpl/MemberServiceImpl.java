package co.yedam.mealkit.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.mealkit.common.DataSource;
import co.yedam.mealkit.member.mapper.MemberMapper;
import co.yedam.mealkit.member.service.MemberService;
import co.yedam.mealkit.member.service.MemberVO;

public class MemberServiceImpl implements MemberService {

	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MemberMapper map = sqlSession.getMapper(MemberMapper.class);
	@Override
	public List<MemberVO> memberSelectList() {
		
		return map.memberSelectList();
	}

	@Override
	public MemberVO memberSelect(MemberVO vo) {
		
		return map.memberSelect(vo);
	}
	
	@Override
	public MemberVO memberViewPage(MemberVO vo) {
		
		return map.memberViewPage(vo);
	}
	
	@Override
	public MemberVO memberSearchPw(MemberVO vo) {
		
		return map.memberSelect(vo);
	}
	


	@Override
	public int memberInsert(MemberVO vo) {
		
		return map.memberInsert(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		
		return map.memberUpdate(vo);
	}
	
	@Override
	public int memberGradeUpdate(MemberVO vo) {
		
		return map.memberGradeUpdate(vo);
	}
	
	@Override
	public int memberMypageUpdate(MemberVO vo) {
		
		return map.memberMypageUpdate(vo);
	}
	
	@Override
	public int memberDelete(MemberVO vo) {
		
		return map.memberDelete(vo);
	}

}
