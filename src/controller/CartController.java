package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.cartDto;
import net.sf.json.JSONObject;

@WebServlet("/cartcont")
public class cartController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		JSONObject obj = new JSONObject();
		String work = req.getParameter("work");
		
		if(work.equals("cmove")) {
			String id = req.getParameter("id");
			cartDao dao = cartDao.getInstance();
			List<cartDto> list = dao.getList(id);
			
			req.setAttribute("list", list);
			forward("./cart/cart_main.jsp", req, resp);
		}else if(work.equals("chgqty")) {
			String sqty = req.getParameter("qty");
			int qty = Integer.parseInt(sqty);
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt(sseq);
			
			cartDao dao = cartDao.getInstance();
			boolean b = dao.updateQty(seq, qty);
			
			obj.put("b", b);
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(obj);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	public void forward(String link,HttpServletRequest req, HttpServletResponse resp) {
		RequestDispatcher dispatcher = req.getRequestDispatcher(link);
		try {
			dispatcher.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}