package co.yedam.mealkit.member.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.product.service.ProductService;
import co.yedam.mealkit.product.service.ProductVO;
import co.yedam.mealkit.product.serviceImpl.ProductServiceImpl;

/**
 * Servlet implementation class MemberLogout
 */
@WebServlet("/memberlogout.do")
public class MemberLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLogout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String name = (String) session.getAttribute("name");
		String message = null;
		
		if(name == (String) session.getAttribute("name")) {
		session.invalidate();
		message = "로그아웃이 정상적으로 완료되었습니다.";
		
		}
		request.setAttribute("message", message);
		
		String viewName = "member/membermessage";
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
