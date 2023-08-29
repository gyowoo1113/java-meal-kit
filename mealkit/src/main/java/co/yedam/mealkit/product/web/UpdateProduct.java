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

import co.yedam.mealkit.category.service.CategoryService;
import co.yedam.mealkit.category.service.CategoryVO;
import co.yedam.mealkit.category.serviceImpl.CategoryServiceImple;
import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.product.service.ProductService;
import co.yedam.mealkit.product.service.ProductVO;
import co.yedam.mealkit.product.serviceImpl.ProductServiceImpl;

@WebServlet("/updateproduct.do")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateProduct() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProductService dao = new ProductServiceImpl();
		ProductVO vo = new ProductVO();
		String saveDir = getServletContext().getRealPath("img/");
		int sizeLimit = 100 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(
				request, 
				saveDir,
				sizeLimit,
				"utf-8",
				new DefaultFileRenamePolicy());
		
		String orininalFile = multi.getOriginalFileName("file");
		if(orininalFile != null) {
			vo.setProductImg(orininalFile);
		}
		vo.setProductId(Integer.parseInt(multi.getParameter("productId")));
		vo.setProductName(multi.getParameter("productName"));
		vo.setProductComment(multi.getParameter("productComment"));
		vo.setProductPrice(Integer.parseInt(multi.getParameter("productPrice")));
		vo.setProductView(multi.getParameter("radios"));
	
		dao.productUpdate(vo);
		
		List<ProductVO> products = new ArrayList<>();
		products = dao.productSelectList();

		request.setAttribute("products", products);
		
		CategoryService dao2 = new CategoryServiceImple();
		List<CategoryVO> categorys = new ArrayList<>();
		categorys = dao2.categorySelectList();
		
		request.setAttribute("categorys", categorys);
		String viewName = "admin/product/manageproduct";
		ViewResolve.forward(request, response, viewName);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
