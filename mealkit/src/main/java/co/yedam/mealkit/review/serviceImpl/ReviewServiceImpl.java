package co.yedam.mealkit.review.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.mealkit.common.DataSource;
import co.yedam.mealkit.review.mapper.ReviewMapper;
import co.yedam.mealkit.review.service.ReviewService;
import co.yedam.mealkit.review.service.ReviewVO;

public class ReviewServiceImpl implements ReviewService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private ReviewMapper map = sqlSession.getMapper(ReviewMapper.class);
	@Override
	public List<Map<String, Object>> reviewSelectList() {
		return map.reviewSelectList();
	}
	
	@Override
	public List<Map<String, Object>> reviewSelectList(String key, String val) {
		return map.reviewSelectList(key, val);
	}
	
	@Override
	public List<ReviewVO> reviewSelectProduct(ReviewVO vo) {
		return map.reviewSelectProduct(vo);
	}
	
	@Override
	public List<ReviewVO> reviewSelectBestReview(ReviewVO vo) {
		map.reviewUpdateHit(vo.getReviewId());
		return map.reviewSelectBestReview(vo);
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

	@Override
	public void reviewUpdateHit(int id) {
		map.reviewUpdateHit(id);
	}

	

	
}
