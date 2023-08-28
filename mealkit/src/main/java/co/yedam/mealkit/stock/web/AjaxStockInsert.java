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
		
		Map<String, Object> dataMap = new HashMap<>();
		StockService dao = new StockServiceImple();
		StockVO vo = new StockVO();

		vo.setStockType(request.getParameter("radios"));
		vo.setProductId(Integer.parseInt(request.getParameter("productId")));
		vo.setStockCount(Integer.parseInt(request.getParameter("stockCount")));
		
		
		///////////////  Product 테이블에 STOCK_COUNT를 Product_stock Insert (재고 유형이 IN/OUT 따라 +/-) -> 리스트 넘기기
		ProductService dao2 = new ProductServiceImpl();
		ProductVO vo2 = new ProductVO();
		
		int stockCount = Integer.parseInt(request.getParameter("stockCount"));
		int productStock = Integer.parseInt(request.getParameter("productStock"));

		System.out.println(request.getParameter("radios"));
		System.out.println("입출고 갯수"+stockCount );
		System.out.println("제품재고" + productStock );
		
	/*
		if(productStock <= stockCount) {// 코드문제
			System.out.println("에러 출고 개수 안됨");
			request.setAttribute("message", "개수가 적어용");
			dataMap.put("message", "재고 부족");
		}else {
			if(request.getParameter("radios").equals("in")) {
				productStock += stockCount;
			}
			else {
				productStock -= stockCount;
			}
			vo2.setProductId(Integer.parseInt(request.getParameter("productId")));
			vo2.setProductStock(productStock);
			
			int n = dao2.productUpdate(vo2);
			if( n == 1) {
				System.out.println("업뎃 성공");
			}
			else {
				System.out.println("업뎃 실패");
			
			}
			dao.insertStock(vo);  //product table이 업데이트 되어야 stock table 동작해야함
		}*/
		////////////////////////////////////////////////////
		if(request.getParameter("radios").equals("in")){
			productStock += stockCount;
			vo2.setProductId(Integer.parseInt(request.getParameter("productId")));
			vo2.setProductStock(productStock);
			dao2.productUpdate(vo2);
			dao.insertStock(vo);
		}else{ //out 상황
			if(stockCount>productStock) {
				System.out.println("에러 출고 개수 안됨");
				request.setAttribute("message", "재고 부족");
				dataMap.put("message", "재고 부족");
			}
			else {
				productStock -= stockCount;
				vo2.setProductId(Integer.parseInt(request.getParameter("productId")));
				vo2.setProductStock(productStock);
				dao2.productUpdate(vo2);
				dao.insertStock(vo);
			}
			
		}
		

		//////////////// 수불대장 ajax 

		List<StockVO> stocks = new ArrayList<>();
		stocks = dao.stockSelectList();
		request.setAttribute("stocks", stocks);
		
	
		//리스트 넘기기
		List<ProductVO> products = new ArrayList<>();
		products= dao2.productManageList();
		request.setAttribute("products", products);
		
		ObjectMapper objectMapper = new ObjectMapper(); 
		
		objectMapper.registerModule(new JavaTimeModule()); 
		objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); 
		
		
		dataMap.put("stocks", stocks);
		dataMap.put("products", products);
		

		String data = objectMapper.writeValueAsString(dataMap);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(data);
	
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
