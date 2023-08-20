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
        int count = Integer.valueOf(request.getParameter("count"));
        int productId = Integer.valueOf(request.getParameter("id"));
        // session id로 수정 필요
        String memberId = "micol";
        int result = doCartInsert(count,productId,memberId);

        String data = getJsonData(result);
        response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(data);
        return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	// -1 : 중복, 1 : 성공, else : 실패
	protected int doCartInsert(int count, int productId, String memberId) {
        CartService dao = new CartServiceImpl();
		int result = -1;
        CartVO findvo = new CartVO(memberId,productId);
        findvo = dao.cartSelect(findvo);
    	// 이미 장바구니에 해당 물품이 있으면, insert 하지않고 return
        if (findvo != null) {
        	return result;
        }
        
        // 물품 중복 없으면 cart insert
        CartVO vo = new CartVO(count,memberId,productId);
        result = dao.cartInsert(vo);
		return result;
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
