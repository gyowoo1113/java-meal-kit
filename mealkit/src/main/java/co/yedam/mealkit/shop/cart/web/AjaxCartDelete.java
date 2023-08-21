package co.yedam.mealkit.shop.cart.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.mealkit.shop.cart.service.CartService;
import co.yedam.mealkit.shop.cart.service.CartVO;
import co.yedam.mealkit.shop.cart.serviceImpl.CartServiceImpl;

@WebServlet("/ajaxcartdelete.do")
public class AjaxCartDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxCartDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartService dao = new CartServiceImpl();
		int cartId = Integer.valueOf(request.getParameter("id"));
		
		CartVO vo = new CartVO();
		vo.setCartId(cartId);
		int resNum = dao.cartDelete(vo);
		
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
