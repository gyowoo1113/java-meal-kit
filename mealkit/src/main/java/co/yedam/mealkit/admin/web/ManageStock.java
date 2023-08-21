package co.yedam.mealkit.admin.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.mealkit.common.ViewResolve;
import co.yedam.mealkit.product.service.ProductService;
import co.yedam.mealkit.product.service.ProductVO;
import co.yedam.mealkit.product.serviceImpl.ProductServiceImpl;
import co.yedam.mealkit.stock.service.StockService;
import co.yedam.mealkit.stock.service.StockVO;
import co.yedam.mealkit.stock.serviceImple.StockServiceImple;


@WebServlet("/managestock.do")
public class ManageStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManageStock() {
        super();  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		StockService dao = new StockServiceImple();
		List<StockVO> stocks = new ArrayList<>();
		ProductService dao2 = new ProductServiceImpl();
		List<ProductVO> products = new ArrayList<>();
		
		stocks = dao.stockSelectList();
		request.setAttribute("stocks", stocks);
		

		products= dao2.productSelectList();
		request.setAttribute("products", products);
		
		String viewName = "admin/stock/managestock";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doGet(request, response);
	}

}
