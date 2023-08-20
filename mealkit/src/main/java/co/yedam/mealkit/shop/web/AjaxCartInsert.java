package co.yedam.mealkit.shop.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.yedam.mealkit.shop.cart.service.CartService;
import co.yedam.mealkit.shop.cart.service.CartVO;
import co.yedam.mealkit.shop.cart.serviceImpl.CartServiceImpl;

@WebServlet("/ajaxcartinsert.do")
public class AjaxCartInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxCartInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CartService dao = new CartServiceImpl();
        
        int count = Integer.valueOf(request.getParameter("count"));
        int productId = Integer.valueOf(request.getParameter("id"));
        // session id로 수정 필요
        String memberId = "micol";
        CartVO vo = new CartVO(count,memberId,productId);
        int result = dao.cartInsert(vo);
        
        
        String data = getJsonData(result);
        response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(data);
        return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected String getJsonData(int result) throws JsonProcessingException {
        Map<String,String> resMap = new HashMap<String, String>();
        String icon = (result == 1) ? "success" : "error";
        String message = (result == 1) ? "카트에 물품이 담겼습니다." : "물품 담기에 실패했습니다.";
        resMap.put("result",icon);
        resMap.put("message", message);
        
        ObjectMapper objectMapper = new ObjectMapper();
        String data = objectMapper.writeValueAsString(resMap);
		return data;
	}

}
