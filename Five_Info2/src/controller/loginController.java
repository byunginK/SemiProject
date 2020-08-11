package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dto.MemberDto;
import dto.loginDto;
import net.sf.json.JSONObject;

@WebServlet("/login")
public class loginController extends HttpServlet {

	@Override 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String work = req.getParameter("work");
		MemberDao dao = MemberDao.getInstance();
if(work.equals("logout")) {
        HttpSession session = req.getSession();
			
        session.removeAttribute("login_Id");;
		 forward("index.jsp", req, resp);
} else if(work.equals("myPage")) {
	        
	      String id = req.getParameter("id");
	      String pwd = req.getParameter("pwd");
	      
	      MemberDto dto = dao.login(id);
	      
	      req.setAttribute("dto", dto);
	      forward("myPage.jsp", req, resp);	      
}else {
	
}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		
		
		
		HttpSession session = req.getSession();
		
		String a = "";

		MemberDao dao = MemberDao.getInstance();
		
		MemberDto dto = dao.login(id);
		loginDto lo_dto = null;
		
		if(dto != null && !dto.getId().equals("")) {
	         	
			a = "YES";
		
	        lo_dto = new loginDto(dto.getId(), dto.getAuth());
	 
	    	session.setAttribute("login_Id", id);
	    	
	    	session.setMaxInactiveInterval(30*60*60);
	            
		
	    //	System.out.println(lo_dto.getAuth());
		}else {
				
				a = "NO";
				
			}
		
		Map<Object, Object> map =  new HashMap<Object, Object>();
		map.put("isS", a);
		JSONObject jobj = new JSONObject();
		jobj.put("map", map);			
		
		resp.setContentType("application/x-json; charset=UTF-8");
		resp.getWriter().print(jobj);
	}
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher(link);
		dis.forward(req, resp);		
	}
	
}
