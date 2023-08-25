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

@WebServlet("/ajaxshipcheckupdate.do")
public class AjaxShipCheckUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxShipCheckUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ordarId = Integer.valueOf(request.getParameter("ordarId"));
        String option = request.getParameter("option");
        
        OrdarService dao = new OrdarServiceImpl();
        OrdarVO vo = new OrdarVO();
        vo.setShipCheck(option);
        vo.setOrdarId(ordarId);
        int res = dao.ordarShipUpdate(vo);
        
        // 업데이트 성공유무 보내야함
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
