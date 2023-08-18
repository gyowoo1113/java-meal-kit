package co.yedam.mealkit.category.service;

import java.util.List;

public interface CategoryService {
	
	List<CategoryVO>categorySelectList();
	CategoryVO categorySelect(CategoryVO vo);
	int insertCategory(CategoryVO vo);
	int updateCategory(CategoryVO vo);
	int deleteCategory(CategoryVO vo);
}
