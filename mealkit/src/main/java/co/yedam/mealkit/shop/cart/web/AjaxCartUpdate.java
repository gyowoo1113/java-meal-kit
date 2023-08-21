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

@WebServlet("/ajaxcartupdate.do")
public class AjaxCartUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxCartUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int count = Integer.valueOf(request.getParameter("count"));
        int cartId = Integer.valueOf(request.getParameter("id"));
        // cartId 사용하기 때문에 굳이 userId 가져올 필요가 없음
        
        CartService dao = new CartServiceImpl();
        CartVO vo = new CartVO(cartId,count);
        int resNum = dao.cartUpdate(vo);
        
        return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
