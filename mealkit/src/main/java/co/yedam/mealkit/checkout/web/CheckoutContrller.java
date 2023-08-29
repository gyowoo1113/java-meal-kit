package co.yedam.mealkit.checkout.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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

import co.yedam.mealkit.address.service.AddressService;
import co.yedam.mealkit.address.service.AddressVO;
import co.yedam.mealkit.address.serviceImpl.AddressServiceImple;
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
		
		String listNum = request.getParameter("list_num");
		String viewName = "checkout/checkoutresult";
		if (listNum == null || Integer.valueOf(listNum) != 0) {
			setCartList(request,Integer.valueOf(listNum));
			setAddressList(request);
			viewName = "checkout/checkout";
		} else {
			request.setAttribute("message", "주문실패: 장바구니에 물건을 담아주세요.");
		}
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void setCartList(HttpServletRequest request, int listNum) throws JsonProcessingException {		
		List<Integer> ids = new ArrayList<Integer>();
		String[] values = request.getParameterValues("check_value");
		for (String cartId : values) {
			ids.add(Integer.valueOf(cartId));
		}
		
		ObjectMapper objectMapper = new ObjectMapper();	
		CartService dao = new CartServiceImpl();
		List<Map<String, Object>> carts = new ArrayList<>();
		carts = dao.cartSelectInList(ids);
		String data = objectMapper.writeValueAsString(carts);
		request.setAttribute("carts", data);
	}
	
	protected void setAddressList(HttpServletRequest request) throws JsonProcessingException {
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("id");
        
		ObjectMapper objectMapper = new ObjectMapper();	
        AddressService dao = new AddressServiceImple();
        
        List<AddressVO> address = new ArrayList<AddressVO>();
        address = dao.addressSelectList(memberId);
		String data = objectMapper.writeValueAsString(address);
		request.setAttribute("address", data);
	}
}
