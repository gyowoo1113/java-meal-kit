package co.yedam.mealkit.order.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.mealkit.ordar.service.OrdarService;
import co.yedam.mealkit.ordar.service.OrdarVO;
import co.yedam.mealkit.ordar.serviceImpl.OrdarServiceImpl;

@WebServlet("/ajaxorderupdate.do")
public class AjaxOrderUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxOrderUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderId = Integer.valueOf(request.getParameter("orderId"));
		OrdarService dao = new OrdarServiceImpl();
		OrdarVO vo = new OrdarVO();
		vo.setOrdarId(orderId);
		dao.ordarUpdate(vo);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
