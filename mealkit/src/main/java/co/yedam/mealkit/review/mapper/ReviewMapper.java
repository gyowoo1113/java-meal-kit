package co.yedam.mealkit.review.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.yedam.mealkit.review.service.ReviewVO;

public interface ReviewMapper {
	List<Map<String, Object>> reviewSelectList();
	List<Map<String, Object>> reviewSelectList(@Param("key") String key, @Param("val") String val);
	List<ReviewVO> reviewSelectProduct(ReviewVO vo);
	ReviewVO reviewSelect(ReviewVO vo);
	int reviewInsert(ReviewVO vo);
	int reviewUpdate(ReviewVO vo);
	int reviewDelete(ReviewVO vo);
	void reviewUpdateHit(int id);
}
