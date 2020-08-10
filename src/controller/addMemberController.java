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

import dao.MemberDao;
import dto.MemberDto;
import dto.loginDto;
import net.sf.json.JSONObject;

@WebServlet("/addmember")
public class addMemberController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String sphone = req.getParameter("phone");
		int phone = Integer.parseInt(sphone);
		String email = req.getParameter("email");
		
		int auth = 3;
		System.out.println(id);
		System.out.println(pwd);
		System.out.println(name);
		System.out.println(phone);
		System.out.println(email);
		MemberDao dao = MemberDao.getInstance();
	
		loginDto dto = new loginDto();
		
		System.out.println(dto.getAuth());
		
		
		boolean isS = dao.addMember(new MemberDto(id, pwd, name, phone, email, auth));
		if(isS) {
			
			forward("login.jsp", req, resp);
			
		}else {
			
			forward("register.jsp", req, resp);
		
		}	
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
	
		String id = req.getParameter("id");
		MemberDao dao = MemberDao.getInstance();
	//	System.out.println(id);
		String a = "";
		
		boolean isS =dao.CheckId(id);
		
			if(isS == true){	// id가 없음
		
				a = "YES";
				
			}else if((isS == false)){			// id가 있음
			
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
