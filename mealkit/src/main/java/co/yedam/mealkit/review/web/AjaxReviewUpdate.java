package co.yedam.mealkit.review.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.mealkit.review.service.ReviewService;
import co.yedam.mealkit.review.service.ReviewVO;
import co.yedam.mealkit.review.serviceImpl.ReviewServiceImpl;

/**
 * Servlet implementation class AjaxReviewUpdate
 */
@WebServlet("/ajaxreviewupdate.do")
public class AjaxReviewUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviewUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewId = Integer.valueOf(request.getParameter("reviewId"));
		
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		
		vo.setReviewId(Integer.valueOf(request.getParameter("reviewId")));
		
		int resNum = dao.reviewUpdateHit(vo);
		
		vo = dao.reviewSelect(vo);
		
		String result = Integer.toString(vo.getReviewHit());
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(result);
		
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
