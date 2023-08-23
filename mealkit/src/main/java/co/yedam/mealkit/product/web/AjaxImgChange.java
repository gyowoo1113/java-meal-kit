package co.yedam.mealkit.product.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/ajaxImgChange.do")
public class AjaxImgChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxImgChange() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String saveDir = getServletContext().getRealPath("attech/proudct/");
		int sizeLimit = 100 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
						request, 
						saveDir,
						sizeLimit,
						"utf-8",
						new DefaultFileRenamePolicy());
		
		String originalFile = multi.getOriginalFileName("file");
		System.out.println(originalFile);
		response.setContentType("text/html; charset=UTF-8"); 
		response.getWriter().append(originalFile); 
		return; 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
