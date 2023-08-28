package co.yedam.mealkit.product.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.yedam.mealkit.product.service.ProductVO;

public interface ProductMapper {
	List<ProductVO> productSelectList();
	List<ProductVO> productManageList(); //ADMIN 재고관리에서 특정 필드 리스트
	List<ProductVO> productViewList(); //홈에서 productView On 리스트
	List<ProductVO> productSelectList(String categoryId);
	List<Map<String, Object>> productSearchList(@Param("key") String key, @Param("val") String val);
	ProductVO productSelect(ProductVO vo);
	int productInsert(ProductVO vo);
	int productUpdate(ProductVO vo);
	int productDelete(ProductVO vo);

}
