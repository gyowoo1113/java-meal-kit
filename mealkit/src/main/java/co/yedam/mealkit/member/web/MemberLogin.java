package co.yedam.mealkit.member.web;

import java.io.IOException;
import java.net.URLEncoder;

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
		
		String message = null;
		
		vo = dao.memberSelect(vo);
		
		if (vo != null) {
			session.setAttribute("id", vo.getMemberId()); // 세션에 값을 넣어줌
			session.setAttribute("name", vo.getMemberName());
			session.setAttribute("email", vo.getMemberEmail());
			message = vo.getMemberName() + "님 환영합니다";
		} else {
			message = "아이디 또는 비밀번호가 맞지 않습니다.";
			
		}
		
		request.setAttribute("message", message);
			
		String viewName = "member/membermessage";
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
