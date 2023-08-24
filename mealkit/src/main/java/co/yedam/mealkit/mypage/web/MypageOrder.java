package co.yedam.mealkit.mypage.web;

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
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.ordar.service.OrdarService;
import co.yedam.mealkit.ordar.service.OrdarVO;
import co.yedam.mealkit.ordar.serviceImpl.OrdarServiceImpl;

@WebServlet("/mypageorder.do")
public class MypageOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageOrder() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("id");
		OrdarService ordarDAO = new OrdarServiceImpl();
		List<OrdarVO> ordars = ordarDAO.ordarSelectList(memberId);
		
		setOrderList(request,ordars);
		String viewName = "mypage/mypage/mypageorder";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void setOrderList(HttpServletRequest request, List<OrdarVO> ordars) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();	
		objectMapper.registerModule(new JavaTimeModule()); 
		objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); 
		
		String data = objectMapper.writeValueAsString(ordars);
		request.setAttribute("order", data);
	}
}
