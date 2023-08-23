package co.yedam.mealkit.checkout.web;

import java.io.IOException;
import java.util.ArrayList;
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

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.shop.cart.service.CartService;
import co.yedam.mealkit.shop.cart.serviceImpl.CartServiceImpl;

@WebServlet("/checkout.do")
public class CheckoutContrller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckoutContrller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		setCartList(request);
		String viewName = "checkout/checkout";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void setCartList(HttpServletRequest request) throws JsonProcessingException {
		int listNum = Integer.valueOf(request.getParameter("list_num"));
		
		List<Integer> ids = new ArrayList<Integer>();
		for (int i=0; i<listNum; ++i) {
			String name = "carts[" + i + "].cartId";
			
			String cartId = request.getParameter(name);
			if (cartId == null) {
				continue;
			}
			ids.add(Integer.valueOf(cartId));
		}
		ObjectMapper objectMapper = new ObjectMapper();	
		CartService dao = new CartServiceImpl();
		List<Map<String, Object>> carts = new ArrayList<>();
		carts = dao.cartSelectInList(ids);
		String data = objectMapper.writeValueAsString(carts);
		request.setAttribute("carts", data);
	}
	
}
