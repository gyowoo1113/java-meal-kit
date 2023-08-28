package co.yedam.mealkit.shop.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.mealkit.category.service.CategoryService;
import co.yedam.mealkit.category.service.CategoryVO;
import co.yedam.mealkit.category.serviceImpl.CategoryServiceImple;
import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.product.service.ProductService;
import co.yedam.mealkit.product.serviceImpl.ProductServiceImpl;

@WebServlet("/shopmenuform.do")
public class ShopMenuform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShopMenuform() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService ps = new ProductServiceImpl();
		List<Map<String, Object>> products = new ArrayList<>();
		
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		
		products = ps.productSearchList(key, val);

		request.setAttribute("products", products);
		
		CategoryService dao2 = new CategoryServiceImple();
		List<CategoryVO> categorys = new ArrayList<>();
		categorys = dao2.categorySelectList();
		
		request.setAttribute("categorys", categorys);
		
		String viewName = "shop/shopmenuform";
		ViewResolve.forward(request, response, viewName);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
