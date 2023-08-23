package co.yedam.mealkit.stock.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.mealkit.stock.service.StockService;
import co.yedam.mealkit.stock.service.StockVO;
import co.yedam.mealkit.stock.serviceImple.StockServiceImple;


@WebServlet("/ajaxstockinsert.do")
public class AjaxStockInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AjaxStockInsert() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StockService dao = new StockServiceImple();
		StockVO vo = new StockVO();

		vo.setStockType(request.getParameter("radios"));
		vo.setProductId(Integer.parseInt(request.getParameter("productCode")));
		vo.setStockCount(Integer.parseInt(request.getParameter("stockCount")));
		
		dao.insertStock(vo);
		return;
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
