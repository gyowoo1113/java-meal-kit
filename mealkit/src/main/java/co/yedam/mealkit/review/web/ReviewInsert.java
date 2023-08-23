package co.yedam.mealkit.review.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.review.service.ReviewService;
import co.yedam.mealkit.review.service.ReviewVO;
import co.yedam.mealkit.review.serviceImpl.ReviewServiceImpl;

/**
 * Servlet implementation class ReviewInsert
 */
@WebServlet("/reviewinsert.do")
public class ReviewInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		
		String saveDir = getServletContext().getRealPath("img/");
		int sizeLimit = 100 * 1024 * 1024; // 파일 첨부 제한
		String str = "";
		MultipartRequest multi = new MultipartRequest(request, saveDir, sizeLimit, "UTF-8",
				new DefaultFileRenamePolicy());
		
		String originalFile = multi.getOriginalFileName("file");
		if (originalFile != null) {
			String fileName = multi.getFilesystemName("file");	
			str = saveDir + fileName;
			
			int num = str.indexOf("img"); // C:// ~ 인덱스로 img까지 찾아줌
			String sub = str.substring(num); // C:에서 img 경로로 바꿈
			vo.setReviewImg(sub);
		}
		
		vo.setMemberId(multi.getParameter("memberId"));
		vo.setProductId(1);
		
		vo.setReviewTitle(multi.getParameter("reviewTitle"));	
		vo.setReviewSubject(multi.getParameter("reviewSubject"));
		
		if (dao.reviewInsert(vo) != 0) {
			request.setAttribute("message", "작성 완료");
		} else {
			request.setAttribute("message", "작성 실패");
		}
		
		String ViewName="review/reviewpost";
		ViewResolve.forward(request, response, ViewName);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
