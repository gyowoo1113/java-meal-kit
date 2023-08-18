package co.yedam.mealkit.category.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.mealkit.category.mapper.CategoryMapper;
import co.yedam.mealkit.category.service.CategoryService;
import co.yedam.mealkit.category.service.CategoryVO;
import co.yedam.mealkit.common.DataSource;

public class CategoryServiceImple implements CategoryService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private CategoryMapper map = sqlSession.getMapper(CategoryMapper.class);

	@Override
	public List<CategoryVO> categorySelectList() {
		
		return map.categorySelectList();
	}

	@Override
	public CategoryVO categorySelect(CategoryVO vo) {
		
		return map.categorySelect(vo);
	}

	@Override
	public int insertCategory(CategoryVO vo) {
	
		return map.insertCategory(vo);
	}

	@Override
	public int updateCategory(CategoryVO vo) {
	
		return map.updateCategory(vo);
	}

	@Override
	public int deleteCategory(CategoryVO vo) {
		
		return map.deleteCategory(vo);
	}

}
