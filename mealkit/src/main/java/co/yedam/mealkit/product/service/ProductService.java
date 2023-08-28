package co.yedam.mealkit.product.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ProductService {
	List<ProductVO> productSelectList();
	List<ProductVO> productManageList();
	List<ProductVO> productViewList();  
	List<ProductVO> productSelectList(String categoryId);
	List<Map<String, Object>> productSearchList(@Param("key") String key, @Param("val") String val);
	ProductVO productSelect(ProductVO vo);
	int productInsert(ProductVO vo);
	int productUpdate(ProductVO vo);
	int productDelete(ProductVO vo);
}
