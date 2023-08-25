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
 * Servlet implementation class MemberMypageUpdate
 */
@WebServlet("/membermypageupdate.do")
public class MemberMypageUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMypageUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();
		
		vo.setMemberId(request.getParameter("id"));
		vo.setMemberName(request.getParameter("name"));
		vo.setMemberEmail(request.getParameter("email"));
		
		//System.out.println(request.getParameter("id") + request.getParameter(" ") + request.getParameter("email") );
		String message = null;
		
		int n = dao.memberUpdateVer3(vo);
		
		if (n != 0) {
			session.setAttribute("id", vo.getMemberId());
			session.setAttribute("name", vo.getMemberName());
			session.setAttribute("email", vo.getMemberEmail());
			message = "수정이 완료되었습니다.";
		} else {
			message = "수정이 실패했습니다.";
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
