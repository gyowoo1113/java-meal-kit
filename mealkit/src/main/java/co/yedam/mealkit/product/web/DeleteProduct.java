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
import co.yedam.mealkit.product.service.ProductService;
import co.yedam.mealkit.product.service.ProductVO;
import co.yedam.mealkit.product.serviceImpl.ProductServiceImpl;

@WebServlet("/deleteproduct.do")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteProduct() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductService dao = new ProductServiceImpl();
		ProductVO vo = new ProductVO();
		
		vo.setProductId(Integer.parseInt(request.getParameter("productId")));
		
		
		dao.productDelete(vo);

		List<ProductVO> products = new ArrayList<>();
		products = dao.productSelectList();

		request.setAttribute("products", products);
	
		
		CategoryService dao2 = new CategoryServiceImple();
		List<CategoryVO> categorys = new ArrayList<>();
		categorys = dao2.categorySelectList();
	
		request.setAttribute("categorys", categorys);
		
		String viewName = "admin/product/manageproduct";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
