package co.yedam.mealkit.review.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ReviewService {
	
	List<Map<String, Object>> reviewSelectList();
	List<Map<String, Object>>reviewSelectList(@Param("key") String key, @Param("val") String val);
	List<ReviewVO> reviewSelectProduct(ReviewVO vo);
	List<ReviewVO> reviewSelectBestReview(ReviewVO vo);
	ReviewVO reviewSelect(ReviewVO vo);
	int reviewInsert(ReviewVO vo);
	int reviewUpdate(ReviewVO vo);
	int reviewDelete(ReviewVO vo);
	void reviewUpdateHit(int id);
}
