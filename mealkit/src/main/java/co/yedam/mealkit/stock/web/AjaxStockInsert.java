package co.yedam.mealkit.stock.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
		
		///////////////  Product 테이블에 STOCK_COUNT를 Product_stock Insert (재고 유형이 IN/OUT 따라 +/-) -> 리스트 넘기기
		ProductService dao2 = new ProductServiceImpl();
		ProductVO vo2 = new ProductVO();
		
		int stockCount = Integer.parseInt(request.getParameter("stockCount"));
		int productStock = Integer.parseInt(request.getParameter("productStock"));
	
		System.out.println(request.getParameter("radios"));
		System.out.println("입출고 갯수"+stockCount );
		System.out.println("제품재고" + productStock );
		if(request.getParameter("radios").equals("in")) {
			productStock += stockCount;
		}
		else {
			if(productStock >= stockCount) {
				productStock -= stockCount;
			}
			else {
				System.out.println("출고수량 부족 !");
			}
		}
		
		vo2.setProductId(Integer.parseInt(request.getParameter("productCode")));
		vo2.setProductStock(productStock);
	
		int n = dao2.productUpdate(vo2);
		
		if( n == 1) {
			System.out.println("업뎃 성공");
		}
		else {
			System.out.println("업뎃 실패");
		}
		
		
		//리스트 넘기기
		List<ProductVO> products = new ArrayList<>();
		products= dao2.productSelectList2();
		request.setAttribute("products", products);
		
	
		ObjectMapper objectMapper = new ObjectMapper(); 
		
		objectMapper.registerModule(new JavaTimeModule()); 
		objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); 
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("stocks", stocks);
		dataMap.put("products", products);

		String data = objectMapper.writeValueAsString(dataMap);
		//String data2 = objectMapper.writeValueAsString(products);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(data);
		//response.getWriter().append(data2);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
