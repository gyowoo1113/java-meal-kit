package co.yedam.mealkit.shop.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.product.service.ProductService;
import co.yedam.mealkit.product.service.ProductVO;
import co.yedam.mealkit.product.serviceImpl.ProductServiceImpl;

/**
 * Servlet implementation class ShopMenuform
 */
@WebServlet("/shopmenuform.do")
public class ShopMenuform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopMenuform() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService ps = new ProductServiceImpl();
		List<ProductVO> products = new ArrayList<>();
		products = ps.productSelectList();

		request.setAttribute("products", products);
		System.out.println(products);
		
		String viewName = "shop/shopmenuform";
		ViewResolve.forward(request, response, viewName);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
