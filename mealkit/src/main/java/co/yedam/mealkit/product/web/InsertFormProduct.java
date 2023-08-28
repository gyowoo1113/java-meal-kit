package co.yedam.mealkit.product.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.mealkit.category.service.CategoryService;
import co.yedam.mealkit.category.service.CategoryVO;
import co.yedam.mealkit.category.serviceImpl.CategoryServiceImple;
import co.yedam.mealkit.common.ViewResolve;


@WebServlet("/insertformproduct.do")
public class InsertFormProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public InsertFormProduct() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CategoryService dao = new CategoryServiceImple();
		List<CategoryVO> categorys = new ArrayList<>();
		categorys = dao.categorySelectList();
		
		request.setAttribute("categorys", categorys);
		String viewName = "admin/product/insertformproduct";
		ViewResolve.forward(request, response, viewName);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
