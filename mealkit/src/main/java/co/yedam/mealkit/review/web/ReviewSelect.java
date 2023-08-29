package co.yedam.mealkit.review.web;

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

/**
 * Servlet implementation class ReviewSelect
 */
@WebServlet("/reviewselect.do")
public class ReviewSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		
		vo.setReviewId(Integer.valueOf(request.getParameter("reviewId")));
		
		vo = dao.reviewSelect(vo);
		
		request.setAttribute("reviews", vo);
		
		String viewName = "admin/review/reviewselect";
		
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
