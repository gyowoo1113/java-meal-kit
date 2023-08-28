package co.yedam.mealkit.product.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.product.service.ProductService;
import co.yedam.mealkit.product.service.ProductVO;
import co.yedam.mealkit.product.serviceImpl.ProductServiceImpl;

@WebServlet("/insertproduct.do")
public class InsertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertProduct() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductService dao = new ProductServiceImpl();
		ProductVO vo = new ProductVO();

		String saveDir = getServletContext().getRealPath("img/");
		int sizeLimit = 100 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(request, saveDir, sizeLimit, "utf-8",
				new DefaultFileRenamePolicy());

		String orininalFile = multi.getOriginalFileName("file");
		if (orininalFile != null) {

			vo.setProductImg(orininalFile);

		}
		vo.setProductName(multi.getParameter("productName"));
		vo.setProductPrice(Integer.parseInt(multi.getParameter("productPrice")));
		vo.setProductComment(multi.getParameter("productComment"));
		vo.setCategoryId(Integer.parseInt(multi.getParameter("categoryId")));
		vo.setProductStock(Integer.parseInt(multi.getParameter("productStock")));

		int n = dao.productInsert(vo);

		if (n == 1 ) {
		
		} else {
		
		}

		List<ProductVO> products = new ArrayList<>();
		products = dao.productSelectList();

		request.setAttribute("products", products);
		
		String viewName = "admin/product/manageproduct";
		ViewResolve.forward(request, response, viewName);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
