package co.yedam.mealkit.stock.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.yedam.mealkit.product.service.ProductService;
import co.yedam.mealkit.product.service.ProductVO;
import co.yedam.mealkit.product.serviceImpl.ProductServiceImpl;

@WebServlet("/ajaxproductselect.do")
public class AjaxProductSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxProductSelect() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductService dao = new ProductServiceImpl();
		ProductVO vo = new ProductVO();

		//vo.setProductId(Integer.valueOf(request.getParameter("productId")));
		vo.setProductId(Integer.parseInt(request.getParameter("productId")));
		
		vo = dao.productSelect(vo);

		
		ObjectMapper objectMapper = new ObjectMapper(); 

		objectMapper.registerModule(new JavaTimeModule()); 
		objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); 

		String data = objectMapper.writeValueAsString(vo); 

		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(data);
		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
