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
import net.sf.json.JSONObject;

@WebServlet("/addmember")
public class addMemberController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); resp.setContentType("text/html; charset=UTF-8"); req.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		
		String id = req.getParameter("id");  String pwd = req.getParameter("pwd");
		String name = req.getParameter("name"); String sphone = req.getParameter("phone");
		int phone = Integer.parseInt(sphone); String email = req.getParameter("email");
		
		int auth = 3;  //관리자 1, 일반 3
		
	//	System.out.println("아뒤: "+id); System.out.println("비번: "+pwd); System.out.println("이름: "+name); System.out.println("전번: "+phone); System.out.println("이메: "+email);
		MemberDao dao = MemberDao.getInstance();

		boolean isS = dao.addMember(new MemberDto(id, pwd, name, phone, email, auth));
		if(isS) {	
			//회원가입 성공
			out.print("<script> alert('회원이 돼주셔서 감사합니다'); location.href = 'login.jsp';</script>");
			out.flush(); 
		}else {
			//회원가입 실패
			out.print("<script> alert('회원가입에 실패했습니다. 해당 현상이 지속되면 문의해주세요(문의전화 02-233-5555)'); location.href = 'index.jsp';</script>");
			out.flush();
		}	
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
	
		String id = req.getParameter("id");
		MemberDao dao = MemberDao.getInstance();
	//	System.out.println(id);
		String a = "";
		
   //  회원 가입시 아이디 중복확인 ajax
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
