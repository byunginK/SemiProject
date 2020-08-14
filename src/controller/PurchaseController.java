package controller;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDetailDao;
import dto.ProductDto;
import dto.cartDto;
import net.sf.json.JSONObject;

@WebServlet("/purchaseCon")
public class PurchaseController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String work = req.getParameter("work");
		String s = req.getParameter("item_seq");
		List<String> list = Arrays.asList(s.split(","));
		ProductDetailDao dao = ProductDetailDao.getInstance();
		if (work.equals("purchasego")) {
			int seq = Integer.parseInt(req.getParameter("purseq"));
			
			ProductDto product = dao.getProduct(seq);
			String color = req.getParameter("color");
			String size = req.getParameter("size");
			String count = req.getParameter("buy_count");

			req.setAttribute("product", product);
			req.setAttribute("color", color);
			req.setAttribute("size", size);
			req.setAttribute("count", count);

			RequestDispatcher dispatcher = req.getRequestDispatcher("purchase.jsp");
			dispatcher.forward(req, resp);
		}else if(work.equals("buylist")) {
			List<cartDto> cartlist = new ArrayList<cartDto>();
			for (int i = 0; i < list.size(); i++) {
				int item_seq = Integer.parseInt(list.get(i));
				cartDto cart = dao.getcart(item_seq);
				cartlist.add(cart);
			}
			req.setAttribute("cartlist", cartlist);
			RequestDispatcher dispatcher = req.getRequestDispatcher("purchase.jsp");
			dispatcher.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String imp_uid = req.getParameter("imp_uid");
		String id = req.getParameter("id");
		String item_seq = req.getParameter("item_seq");
		String qty = req.getParameter("count");
		String size = req.getParameter("size");
		String color = req.getParameter("color");
		
		System.out.println(id+" "+item_seq+" "+qty+" "+size+" "+color);
		
		JSONObject jobj = new JSONObject();
		jobj.put("imp_uid", imp_uid);
		resp.setContentType("application/x-json; charset=UTF-8");
		resp.getWriter().print(jobj);
	}

	
}
