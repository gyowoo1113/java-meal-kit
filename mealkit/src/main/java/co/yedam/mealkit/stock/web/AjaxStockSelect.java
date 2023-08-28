package co.yedam.mealkit.stock.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.yedam.mealkit.stock.service.StockService;
import co.yedam.mealkit.stock.serviceImple.StockServiceImple;

@WebServlet("/ajaxstockselect.do")
public class AjaxStockSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxStockSelect() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StockService dao = new StockServiceImple();
		List<Map<String, Object>> stocks = new ArrayList<>();

		String requestBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
		 
		stocks = dao.stockSelectList(requestBody);
	
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
