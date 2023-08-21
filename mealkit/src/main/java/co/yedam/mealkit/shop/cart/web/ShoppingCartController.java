package co.yedam.mealkit.shop.cart.web;

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

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.shop.cart.service.CartService;
import co.yedam.mealkit.shop.cart.service.CartVO;
import co.yedam.mealkit.shop.cart.serviceImpl.CartServiceImpl;

@WebServlet("/shoppingcart.do")
public class ShoppingCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShoppingCartController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartService dao = new CartServiceImpl();
		// 추후 sqlSession의 id로 변경 필요
		List<Map<String, Object>> carts = new ArrayList<>();
		
		ObjectMapper objectMapper = new ObjectMapper();	
		carts = dao.cartSelectList("micol");
		String data = objectMapper.writeValueAsString(carts);
		request.setAttribute("carts", data);
		
		String viewName = "shop/shoppingcart";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
