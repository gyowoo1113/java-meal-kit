package co.yedam.mealkit.product.mapper;

import java.util.List;

import co.yedam.mealkit.product.service.ProductVO;

public interface ProductMapper {
	List<ProductVO> productSelectList();
	ProductVO productSelect(ProductVO vo);
	int productInsert(ProductVO vo);
	int productUpdate(ProductVO vo);
	int productDelete(ProductVO vo);
}
