package co.yedam.mealkit.review.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ReviewService {
	
	List<ReviewVO> reviewSelectList();
	List<Map<String, Object>>reviewSelectList(@Param("key") String key, @Param("val") String val);
	List<ReviewVO> reviewSelectProduct(ReviewVO vo);
	List<ReviewVO> reviewSelectMember(ReviewVO vo);
	List<ReviewVO> reviewSelectBestReview(ReviewVO vo);
	ReviewVO reviewSelect(ReviewVO vo);
	int reviewInsert(ReviewVO vo);
	int reviewUpdate(ReviewVO vo);
	int reviewDelete(ReviewVO vo);
	int reviewUpdateHit(ReviewVO vo);
}
