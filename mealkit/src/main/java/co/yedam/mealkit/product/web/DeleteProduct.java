package co.yedam.mealkit.product.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
;
		vo.setProductId(Integer.parseInt(request.getParameter("productId")));
		
		
		int n = dao.productDelete(vo);

		if (n == 1) {
			request.setAttribute("message", "제품 삭제 OOOO");
		} else {
			request.setAttribute("message", "제품 삭제 XXXX");
		}
		String viewName = "admin/product/message";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
