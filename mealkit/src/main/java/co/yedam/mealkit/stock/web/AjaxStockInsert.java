package co.yedam.mealkit.stock.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
import co.yedam.mealkit.stock.service.StockService;
import co.yedam.mealkit.stock.service.StockVO;
import co.yedam.mealkit.stock.serviceImple.StockServiceImple;

@WebServlet("/ajaxstockinsert.do")
public class AjaxStockInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxStockInsert() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StockService dao = new StockServiceImple();
		StockVO vo = new StockVO();

		vo.setStockType(request.getParameter("radios"));
		vo.setProductId(Integer.parseInt(request.getParameter("productCode")));
		vo.setStockCount(Integer.parseInt(request.getParameter("stockCount")));

		dao.insertStock(vo);

		//////////////// 수불대장 ajax 

		List<StockVO> stocks = new ArrayList<>();
		stocks = dao.stockSelectList();
		request.setAttribute("stocks", stocks);

		
		ProductService dao2 = new ProductServiceImpl();
		List<ProductVO> products = new ArrayList<>();
		
		products= dao2.productSelectList2();
		request.setAttribute("products", products);
	
		ObjectMapper objectMapper = new ObjectMapper(); 
		
		objectMapper.registerModule(new JavaTimeModule()); 
		objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); 

		String data = objectMapper.writeValueAsString(stocks);
			
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(data);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
