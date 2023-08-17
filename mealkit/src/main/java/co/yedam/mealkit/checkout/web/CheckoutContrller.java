package co.yedam.mealkit.checkout.web;

import java.io.IOException;
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
		String viewName = "checkout/checkout";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
