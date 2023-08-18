package co.yedam.mealkit.stock.serviceImple.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.stock.service.StockService;
import co.yedam.mealkit.stock.service.StockVO;
import co.yedam.mealkit.stock.serviceImple.StockServiceImple;

@WebServlet("/stockselect.do")
public class StockSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public StockSelect() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		StockService dao = new StockServiceImple();
		StockVO vo = new StockVO();
		
		vo = dao.stockSelect(vo);
		
		request.setAttribute("s", vo);
		String viewName = "admin/stock/stockselect";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
