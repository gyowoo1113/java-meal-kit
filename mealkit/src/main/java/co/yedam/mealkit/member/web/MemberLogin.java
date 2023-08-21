package co.yedam.mealkit.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.member.service.MemberService;
import co.yedam.mealkit.member.service.MemberVO;
import co.yedam.mealkit.member.serviceImpl.MemberServiceImpl;

/**
 * Servlet implementation class MemberLogin
 */
@WebServlet("/memberlogin.do")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();
		
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPassword(request.getParameter("memberPassword"));
		System.out.println(vo.getMemberId() +  vo.getMemberPassword());
		
		vo = dao.memberSelect(vo);
		
		System.out.println(vo);
		if (vo != null) {
			session.setAttribute("id", vo.getMemberId()); // 세션에 값을 넣어줌
			session.setAttribute("name", vo.getMemberName());
			session.setAttribute("email", vo.getMemberEmail());
		}
		
		String viewName = "home/home";
		ViewResolve.forward(request, response, viewName);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
