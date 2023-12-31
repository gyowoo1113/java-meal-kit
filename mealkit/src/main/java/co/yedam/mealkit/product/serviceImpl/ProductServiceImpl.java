package co.yedam.mealkit.product.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.mealkit.common.DataSource;
import co.yedam.mealkit.product.mapper.ProductMapper;
import co.yedam.mealkit.product.service.ProductService;
import co.yedam.mealkit.product.service.ProductVO;

public class ProductServiceImpl implements ProductService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ProductMapper map = sqlSession.getMapper(ProductMapper.class);
	
	@Override
	public List<ProductVO> productSelectList() {
		return map.productSelectList();
	}
	
	@Override
	public List<ProductVO> productManageList() {
		
		return map.productManageList();
	}
	
	@Override
	public List<Map<String, Object>> productSearchList(String key, String val) {
		return map.productSearchList(key, val);
	}
	
	@Override
	public ProductVO productSelect(ProductVO vo) {
		return map.productSelect(vo);
	}

	@Override
	public int productInsert(ProductVO vo) {
		return map.productInsert(vo);
	}

	@Override
	public int productUpdate(ProductVO vo) {
		return map.productUpdate(vo);
	}

	@Override
	public int productDelete(ProductVO vo) {
		return map.productDelete(vo);
	}


	@Override
	public List<ProductVO> productSelectList(String categoryId) {
	
		return map.productSelectList(categoryId);
	}

	@Override
	public List<ProductVO> productViewList() {
		
		return map.productViewList();
	}

	



}
