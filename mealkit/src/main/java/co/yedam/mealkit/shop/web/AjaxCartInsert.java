package co.yedam.mealkit.shop.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        int count = Integer.valueOf(request.getParameter("count"));
        int productId = Integer.valueOf(request.getParameter("id"));
        
        CartService dao = new CartServiceImpl();
        CartVO vo = new CartVO();
        vo.setCartCount(count);
        vo.setProductId(productId);
        // session id로 수정 필요
        vo.setMemberId("micol");
        dao.cartInsert(vo);
        
        return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
