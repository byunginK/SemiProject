package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import dto.suggestDto;
import net.sf.json.JSONObject;

@WebServlet("/login")
public class loginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); resp.setContentType("text/html; charset=UTF-8"); req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession(); PrintWriter out = resp.getWriter();
		String work = req.getParameter("work"); MemberDao dao = MemberDao.getInstance();
		String id = req.getParameter("id");  String pwd = req.getParameter("pwd");
		Map<Object, Object> map =  new HashMap<Object, Object>(); JSONObject jobj = new JSONObject(); String a ="";

		
if(work.equals("logout")) {
	//로그아웃 
       
        session.removeAttribute("login_Dto");
        forward("FirstOpen.jsp", req, resp);
        
} else if(work.equals("updatePage")) {
    //회원 정보 수정     	 
MemberDto dto = (MemberDto)dao.login(id, pwd);
    	  if(dto != null) {
    		  a ="Yes_update";
    	  }else {
    		  a = "NO";
    	  }
    	  map.put("isS", a);
			jobj.put("map", map);			
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(jobj);
}else if(work.equals("deleteMember")) {
MemberDto dto = (MemberDto)dao.login(id, pwd);
if(dto != null) {
	 a ="Yes_delete";
  }else {
	  a = "NO";
  }
map.put("isS", a);
jobj.put("map", map);			
resp.setContentType("application/x-json; charset=UTF-8");
resp.getWriter().print(jobj);
}

else if(work.equals("MyPage")) {
	
	        int m_grade = dao.Mem_Grade(id);
	        req.setAttribute("m_grade", m_grade);
	        forward("main/MyPage.jsp", req, resp);
}else {
	
}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); resp.setContentType("text/html; charset=UTF-8"); req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id"); String pwd = req.getParameter("pwd");
		HttpSession session = req.getSession();
		
		String a = "";

		MemberDao dao = MemberDao.getInstance();
		
		MemberDto dto = dao.login(id, pwd);
		
		MemberDto log = null;
		String lo_name = null;
		int lo_auth = 3;
		if(dto != null && !dto.getId().equals("")) {
			lo_auth = dto.getAuth();
			lo_name = dto.getName();
			if(lo_auth == 0) {
			    a = "del_Mem";
			}
			else {
				a = "YES";
		
			 log = new MemberDto(dto.getId(),dto.getPwd(), dto.getName(), dto.getPhone(), dto.getEmail(), dto.getAuth());
			 
	    	session.setAttribute("login_Dto", log);
	    	session.setMaxInactiveInterval(30*60*60);
			}
	    //	System.out.println(lo_dto.getAuth());
		} 
		else {	
				a = "NO";		
			}
		
		Map<Object, Object> map =  new HashMap<Object, Object>();

		map.put("isS", a);  map.put("name", lo_name);
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
