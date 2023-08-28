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
 * Servlet implementation class MemberMypage
 */
@WebServlet("/membermypage.do")
public class MemberMypage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMypage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 하면 그 값을 마이페이지에 자동으로 불러오는 기능입니다
		
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();
		
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPassword(request.getParameter("memberPassword"));
		vo.setMemberName(request.getParameter("memberName"));
		vo.setMemberEmail(request.getParameter("memberEmail"));
		vo.setMemberGrade(request.getParameter("memberGrade"));
		
		System.out.println(request.getParameter("memberId") + request.getParameter("memberPassword"));
		
		try {
			vo = dao.memberViewPage(vo);
			
			if (vo != null) {
				session.setAttribute("id", vo.getMemberId()); // 세션에 값을 넣어줌
				session.setAttribute("pw", vo.getMemberPassword());
				session.setAttribute("name", vo.getMemberName());
				session.setAttribute("email", vo.getMemberEmail());
				session.setAttribute("grade", vo.getMemberGrade());
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}	
		
		
		String viewName = "mypage/mypage/mypage";
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
