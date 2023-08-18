package co.yedam.mealkit.review.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.mealkit.common.DataSource;
import co.yedam.mealkit.review.mapper.ReviewMapper;
import co.yedam.mealkit.review.service.ReviewService;
import co.yedam.mealkit.review.service.ReviewVO;

public class ReviewServiceImpl implements ReviewService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private ReviewMapper map = sqlSession.getMapper(ReviewMapper.class);
	@Override
	public List<ReviewVO> reviewSelectList() {
		
		return map.reviewSelectList();
	}

	@Override
	public ReviewVO reviewSelect(ReviewVO vo) {
		
		return map.reviewSelect(vo);
	}

	@Override
	public int reviewInsert(ReviewVO vo) {
	
		return map.reviewInsert(vo);
	}

	@Override
	public int reviewUpdate(ReviewVO vo) {
	
		return map.reviewUpdate(vo);
	}

	@Override
	public int reviewDelete(ReviewVO vo) {
		
		return map.reviewDelete(vo);
	}

}
