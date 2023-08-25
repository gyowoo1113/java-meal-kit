package co.yedam.mealkit.admin.web;

import java.io.IOException;
import java.util.ArrayList;
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

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.order.detail.service.OrderDetailService;
import co.yedam.mealkit.order.detail.serviceImpl.OrderDetailServiceImpl;

@WebServlet("/managecheckout.do")
public class ManageCheckout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManageCheckout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDetailService dao = new OrderDetailServiceImpl();
		List<Map<String,Object>> ordars = new ArrayList<Map<String,Object>>();
		ordars = dao.orderDetailSelectListAll();
		
		ObjectMapper objectMapper = new ObjectMapper();	
		objectMapper.registerModule(new JavaTimeModule()); 
		objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); 
		
		String data = objectMapper.writeValueAsString(ordars);
		request.setAttribute("ordars", data);
		
		String viewName = "admin/checkout/managecheckout";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
