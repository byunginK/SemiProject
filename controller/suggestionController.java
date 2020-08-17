package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.CookieStore;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.suggestDao;
import dto.suggestDto;
import net.sf.json.JSONObject;

@WebServlet("/suggest")
public class suggestionController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		resp.setCharacterEncoding("UTF-8"); resp.setContentType("text/html; charset=UTF-8"); req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession(); PrintWriter out = resp.getWriter();
		String detailwork = req.getParameter("detailwork"); String work = req.getParameter("work");
		   
		  
if(work.equals("suggest")) {
	suggestDao dao = suggestDao.getInstance();
     
	     String sseq = req.getParameter("seq"); 
   		 String option = req.getParameter("option");
   		 String text = req.getParameter("text");
   		 String spageNumber = req.getParameter("pageNumber");
     		
          	if(option == null||option.equals("")){
				option = "all";
		    }	
			//System.out.println("옵션 나오냐? " + option);
		     if(text == null||text.equals("")){
		    	text = "";   option = "all";
		    }
		     int len = dao.getALllBbs(option, text);
			int pageNumber = 0; // 현재 페이지
	        if(spageNumber != null && !spageNumber.equals("")){
				 pageNumber = Integer.parseInt(spageNumber);
				}
			 System.out.println(pageNumber);
			List<suggestDto> list = dao.getSuggestList(option, text, pageNumber);
			 
			 int allPage = len / 10 ;    
	        if(len% 10> 0){  allPage = allPage +1;  }
			       int endPage = pageNumber+5;
	
   if(detailwork.equals("suggest_main")) {
				 
	 //System.out.println("왜 null이냐고  페넘"+pageNumber); System.out.println("왜 null이냐고 총페 "+allPage); System.out.println(" 아니 NULL도 아닌데 막페"+endPage);
	   req.setAttribute("allPage", allPage);   req.setAttribute("endPage", endPage); req.setAttribute("pageNumbers", pageNumber); req.setAttribute("suggestList", list);
	   forward("suggest_main.jsp", req, resp);} 
   
   else if(detailwork.equals("paging")){

	 //System.out.println("왜 null이냐고 페넘 "+pageNumber);System.out.println("왜 null이냐고  총페"+allPage);System.out.println(" 아니 NULL도 아닌데 막페 "+endPage);// System.out.println("리.사 "+list.size());
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				  
	            map.put("suggestList", list); map.put("endPage", endPage); map.put("startPage",pageNumber);
	         	
				JSONObject jobj = new JSONObject();
				jobj.put("map", map);			
				resp.setContentType("application/x-json; charset=UTF-8");
				resp.getWriter().print(jobj); }

 else if(detailwork.equals("suggest_detail")) {   
		  
		  String id = (String)session.getAttribute("login_Id");
					
	          if(id == null) {
	        	  
	            out.print("<script> let result = confirm('로그인이 필요한 페이지입니다.  로그인페이지로 이동하시겠습니까?'); if(result){location.href = 'login.jsp';} else{alert('로그인후 이용해주세요'); location.href = 'suggest?work=suggest&detailwork=suggest_main';}</script>");
				out.flush(); 
				}
			  else {
			 int seq = Integer.parseInt(sseq);
				suggestDto dto = dao.getSuggest(seq); 
	        	
	        	Cookie[] cookies = req.getCookies();
	       	
	        	boolean isGet=false;
	        	
	        if(cookies!=null){   
	        	   for(Cookie c: cookies){//    
	        	    //num쿠키가 있는 경우
	        	    if(c.getName().equals(sseq)){
	        	     isGet=true; 
	        	    }
	        	   }
	        	   // num쿠키가 없는 경우
	        	   if(!isGet) {
	        	    dao.readcount(seq);//조회수증가
	        	    Cookie c1 = new Cookie(sseq, sseq);
	        	    c1.setMaxAge(1*24*60*60);
	        	    resp.addCookie(c1);    
	        	   }
	        	  }	
                req.setAttribute("suggest_dto", dto); 
                forward("suggestDetail.jsp", req, resp);}
	          }
	 
 else if(detailwork.equals("writeIdcheck")) {  
		   
		   String id = (String)session.getAttribute("login_Id");	
		   if(id == null) {  
			   
			out.print("<script> let result = confirm('로그인이 필요한 페이지입니다.  로그인페이지로 이동하시겠습니까?'); if(result){location.href = 'login.jsp';} else{alert('로그인후 이용해주세요'); location.href = 'suggest?work=suggest&detailwork=suggest_main';}</script>");
			out.flush();
		   }else {    
		    	forward("suggestwrite.jsp?id="+id, req, resp);  
		    	} 
}else {
	forward("index.jsp", req, resp);
				}
				
				}
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   req.setCharacterEncoding("utf-8");  resp.setCharacterEncoding("UTF-8"); resp.setContentType("text/html; charset=UTF-8");

     String work= req.getParameter("work"); String detailwork= req.getParameter("detailwork"); 
	String sseq = req.getParameter("seq"); String title = req.getParameter("title"); String content = req.getParameter("content"); String id = req.getParameter("id");
		PrintWriter out = resp.getWriter();
if(work.equals("suggest")) {	
		suggestDao dao = suggestDao.getInstance();   
	if(detailwork.equals("suggest_write")) {
          
  //System.out.println("타이틀?"+title);//System.out.println("내용? "+content);
	        boolean isS = dao.writeBbs(new suggestDto(id, title, content));
	        if(isS){ 
	        	 out.print("<script> alert('글이 등록되었습니다'); location.href = 'suggest?work=suggest&detailwork=suggest_main';</script>");
	        	 out.flush();
	       }else{
	    	     out.print("<script>alert('등록에 실패했습니다'); location.href = 'suggest?work=suggest&detailwork=suggest_main';</script>");
	             out.flush();
	       }    
		 }
	else if(detailwork.equals("suggest_delete")) {
		         int seq = Integer.parseInt(sseq);
		         dao.deletesuggest(seq);
		         out.print("<script>alert('삭제되었습니다'); location.href = 'suggest?work=suggest&detailwork=suggest_main';</script>");
                 out.flush();
 
	}else if(detailwork.equals("suggest_update")) {
				 int seq = Integer.parseInt(sseq);
				 dao.suggestUpdate(title, content, seq);
				 out.print("<script>alert('수정이 완료되었습니다.'); location.href = 'suggest?work=suggest&detailwork=suggest_main';</script>");
		         out.flush();
		 }
	else if(detailwork.equals("suggest_answer")) {
		         title = sseq+"번째의 답글";
		         int seq = Integer.parseInt(sseq);
		         boolean isS = dao.answer(seq, new suggestDto(id, title, content));
		         if(isS) {
		        	 
		         }else {
		        	 
		         }
	}
	}
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher(link);
		dis.forward(req, resp);		
	}
}
