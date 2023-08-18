package co.yedam.mealkit.category.mapper;

import java.util.List;

import co.yedam.mealkit.category.service.CategoryVO;

public interface CategoryMapper {
	List<CategoryVO>categorySelectList();
	CategoryVO categorySelect(CategoryVO vo);
	int insertCategory(CategoryVO vo);
	int updateCategory(CategoryVO vo);
	int deleteCategory(CategoryVO vo);
}
