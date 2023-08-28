package co.yedam.mealkit.admin.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.review.service.ReviewService;
import co.yedam.mealkit.review.service.ReviewVO;
import co.yedam.mealkit.review.serviceImpl.ReviewServiceImpl;

@WebServlet("/managereview.do")
public class ManageReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ManageReview() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService rs = new ReviewServiceImpl();
		List<ReviewVO> reviews = new ArrayList<>();
		reviews = rs.reviewSelectList();
		
		request.setAttribute("reviews", reviews);
		
		String viewName = "admin/review/managereview";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
