package co.yedam.mealkit.review.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.ordar.service.OrdarService;
import co.yedam.mealkit.ordar.service.OrdarVO;
import co.yedam.mealkit.ordar.serviceImpl.OrdarServiceImpl;
import co.yedam.mealkit.order.detail.service.OrderDetailService;
import co.yedam.mealkit.order.detail.serviceImpl.OrderDetailServiceImpl;
import co.yedam.mealkit.review.service.ReviewService;
import co.yedam.mealkit.review.service.ReviewVO;
import co.yedam.mealkit.review.serviceImpl.ReviewServiceImpl;

/**
 * Servlet implementation class ReviewManagement
 */
@WebServlet("/mypagereview.do")
public class ReviewMyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewMyPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("id");
		
		ReviewService rs = new ReviewServiceImpl();
		List<ReviewVO> reviews = new ArrayList<>();
		ReviewVO vo = new ReviewVO();
		
		vo.setMemberId(memberId);
		
		reviews = rs.reviewSelectProduct(vo);
		
		setProductList(request,memberId);
		
		request.setAttribute("reviews", reviews);
		String viewName = "mypage/review/mypagereview";
		ViewResolve.forward(request, response, viewName);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void setProductList(HttpServletRequest request,String memberId) throws JsonProcessingException {
		OrdarService ordarDAO = new OrdarServiceImpl();
		List<OrdarVO> ordars = ordarDAO.ordarSelectList(memberId);
		List<Integer> ids = new ArrayList<Integer>();
		for (OrdarVO ordar : ordars) {
			ids.add(ordar.getOrdarId());
		}
		
		OrderDetailService detailDAO = new OrderDetailServiceImpl();
		List<Map<String,Object>> products = new ArrayList<>();
		if (ids.isEmpty() == false) {
			products = detailDAO.orderDetailProductList(ids);
		}
		request.setAttribute("products", products);
	}

}
