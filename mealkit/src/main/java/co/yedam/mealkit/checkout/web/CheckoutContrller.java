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

import co.yedam.mealkit.common.ViewResolve;

@WebServlet("/checkout.do")
public class CheckoutContrller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckoutContrller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listNum = Integer.valueOf(request.getParameter("list_num"));
		
		List<Integer> ids = new ArrayList<Integer>();
		for (int i=0; i<listNum; ++i) {
			String name = "carts[" + i + "].cartId";
			int cartId = Integer.valueOf(request.getParameter(name));
			ids.add(cartId);
		}
		String viewName = "checkout/checkout";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
