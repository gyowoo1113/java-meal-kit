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
import co.yedam.mealkit.review.service.ReviewService;
import co.yedam.mealkit.review.service.ReviewVO;
import co.yedam.mealkit.review.serviceImpl.ReviewServiceImpl;

@WebServlet("/shopdetail.do")
public class ShopDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShopDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		
//		vo.setProductId(Integer.valueOf(request.getParameter("productId")));
		vo.setProductId(1);
		
		List<ReviewVO> reviews = new ArrayList<>();
		reviews = dao.reviewSelectProduct(vo);
		
		request.setAttribute("reviews", reviews);
		int productId = Integer.valueOf(request.getParameter("productId"));		
		setProduct(request,productId);
		String viewName = "shop/shopdetail";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void setProduct(HttpServletRequest request, int productId) {
		ProductService dao = new ProductServiceImpl();
		ProductVO productVO = new ProductVO();
		
		productVO.setProductId(productId);
		productVO = dao.productSelect(productVO);
		
		request.setAttribute("product", productVO);
	}

}
