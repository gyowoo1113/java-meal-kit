package co.yedam.mealkit.order.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.mealkit.address.service.AddressService;
import co.yedam.mealkit.address.service.AddressVO;
import co.yedam.mealkit.address.serviceImpl.AddressServiceImple;
import co.yedam.mealkit.common.ViewResolve;

@WebServlet("/orderinsert.do")
public class OrderInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("id");
		int addressId = getAddressId(request,memberId);
		
		String viewName = "home/home";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	// checked radio button type에 따라서 addressId 구하기
	protected int getAddressId(HttpServletRequest request,String memberId) {
		String addressRadio = request.getParameter("addressType");
		int addressId = -1;
		if (addressRadio.equals("insert")) {
		} else {
			addressId = Integer.valueOf(request.getParameter("addressId"));
		}
		return addressId;
	}
	
}
