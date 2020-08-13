package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDetailDao;
import dto.CartDto;
import dto.ProductDto;

@WebServlet("/cartCon")
public class CartController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int seq = Integer.parseInt(req.getParameter("purseq"));
		String id = req.getParameter("id");
		ProductDetailDao dao = ProductDetailDao.getInstance();
		ProductDto product = dao.getProduct(seq);
		String color = req.getParameter("color");
		String size = req.getParameter("size");
		String count = req.getParameter("buy_count");
		int qty = Integer.parseInt(count);
		String totalPrice = req.getParameter("totalprice");
		
		boolean isS = dao.insertCart(id, seq, qty);
		List<CartDto> list = new ArrayList<CartDto>();
		if(isS) {
			list = dao.getcartlist(id);
			req.setAttribute("list", list);
			forward("cart.jsp", req, resp);
		}
	}
	
	public void forward(String linkname, HttpServletRequest req, HttpServletResponse resp) {
		RequestDispatcher dispatcher = req.getRequestDispatcher(linkname);
		try {
			dispatcher.forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
