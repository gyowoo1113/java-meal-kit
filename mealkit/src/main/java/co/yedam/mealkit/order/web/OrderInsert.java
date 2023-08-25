package co.yedam.mealkit.order.web;

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

import co.yedam.mealkit.address.service.AddressService;
import co.yedam.mealkit.address.service.AddressVO;
import co.yedam.mealkit.address.serviceImpl.AddressServiceImple;
import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.ordar.service.OrdarService;
import co.yedam.mealkit.ordar.service.OrdarVO;
import co.yedam.mealkit.ordar.serviceImpl.OrdarServiceImpl;
import co.yedam.mealkit.order.detail.service.OrderDetailService;
import co.yedam.mealkit.order.detail.service.OrderDetailVO;
import co.yedam.mealkit.order.detail.serviceImpl.OrderDetailServiceImpl;
import co.yedam.mealkit.shop.cart.service.CartService;
import co.yedam.mealkit.shop.cart.service.CartVO;
import co.yedam.mealkit.shop.cart.serviceImpl.CartServiceImpl;

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
		
		String message="주문성공: 마이페이지에서 결제해주세요.";
		if (addressId == 0) {
			message="주문실패: 다시 주문해주세요.";
		}
		request.setAttribute("message", message);
		
		orderInsert(memberId,addressId);
		setOrderDetail(request);
		
		String viewName = "checkout/checkoutresult";
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
			addressId = insertAndGetId(request,memberId);
		} else {
			addressId = Integer.valueOf(request.getParameter("addressId"));
		}
		return addressId;
	}
	
	//  Address 테이블에 Insert 후 AddressId 값 받아옴
	protected int insertAndGetId(HttpServletRequest request, String memberId) {
		AddressService addressDAO = new AddressServiceImple();
		
		String zip = request.getParameter("zip_kakao");
		String addr = request.getParameter("address_kakao");
		String addrDetail = request.getParameter("address_detail");
		String address = addr +"/ "+ addrDetail;
		
		AddressVO addressVO = new AddressVO(Integer.valueOf(zip),address,memberId,"집");
		// 입력 실패 처리 추가필요
		int res = addressDAO.addressInsert(addressVO);
		addressVO = addressDAO.addressSelect(addressVO);
		
		return addressVO.getAddressId();
	}
	
	protected void orderInsert(String memberId, int addressId ) {
		OrdarService dao = new OrdarServiceImpl();
		OrdarVO ordarVO = new OrdarVO(memberId,addressId);
		int res = dao.ordarInsert(ordarVO);
	}
	
	protected void setOrderDetail(HttpServletRequest request) {
		OrdarService dao = new OrdarServiceImpl();
		int orderId = dao.ordarIdMax();

		List<Integer> ids = getCartIdList(request);
		orderDetailInsert(ids, orderId);
	}
	
	protected List<Integer> getCartIdList(HttpServletRequest request){
		List<Integer> ids = new ArrayList<Integer>();
		int num = Integer.valueOf(request.getParameter("cart_num"));
		for (int i=0; i<num; ++i) {
			String name = "cart[" + i +"]";
			String id = request.getParameter(name);
			ids.add(Integer.valueOf(id));
		}
		return ids;
	}
	
	protected void orderDetailInsert(List<Integer> ids, int orderId) {
		CartService cartDAO = new CartServiceImpl();
		OrderDetailService detailDAO = new OrderDetailServiceImpl();
		List<Map<String, Object>> carts = new ArrayList<>();
		carts = cartDAO.cartSelectInList(ids);
		
		for (Map<String,Object> cart : carts) {
			String count = String.valueOf(cart.get("cartCount"));
			String price = String.valueOf(cart.get("productPrice"));
			String productId = String.valueOf(cart.get("productId"));
			OrderDetailVO vo = new OrderDetailVO(Integer.valueOf(count),Integer.valueOf(price),Integer.valueOf(productId),orderId);
			int res = detailDAO.orderDetailInsert(vo);
		}
		
		// order-detail에 insert한 제품 삭제
		cartDAO.cartDeleteList(ids);
	}
}
