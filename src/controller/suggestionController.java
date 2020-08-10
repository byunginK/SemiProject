package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		String detailwork = req.getParameter("detailwork"); String work = req.getParameter("work");
		 String sseq = req.getParameter("seq"); 
		 String option = req.getParameter("option");
		 String text = req.getParameter("text");
		 String spageNumber = req.getParameter("pageNumber");
		 suggestDao dao = suggestDao.getInstance();
		
		 HttpSession session = req.getSession();
     	
		
     	if(work.equals("suggest")) {

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
			 
			 int allPage = len / 10 ;    //예: 12개  -> 2페이지
			  if(len% 10> 0){
				  allPage = allPage +1;     // -> 2  페이지 플러그인 넣기
			   }
			  int endPage = pageNumber+5;
	
		   for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	 if(detailwork.equals("suggest_main")) {
				 
	System.out.println("왜 null이냐고  페넘"+pageNumber); System.out.println("왜 null이냐고 총페 "+allPage); System.out.println(" 아니 NULL도 아닌데 막페"+endPage);
	req.setAttribute("allPage", allPage);   req.setAttribute("endPage", endPage); req.setAttribute("pageNumbers", pageNumber); req.setAttribute("suggestList", list);
			 forward("suggest_main.jsp", req, resp);

		 }else if(detailwork.equals("paging")){

			 System.out.println("왜 null이냐고 페넘 "+pageNumber);System.out.println("왜 null이냐고  총페"+allPage);System.out.println(" 아니 NULL도 아닌데 막페 "+endPage);
			 System.out.println("리.사 "+list.size());
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				  
	            map.put("suggestList", list); map.put("endPage", endPage); map.put("startPage",pageNumber);
	         	
				JSONObject jobj = new JSONObject();
				jobj.put("map", map);			
				
				resp.setContentType("application/x-json; charset=UTF-8");
				
				resp.getWriter().print(jobj);
				 }

	        else if(detailwork.equals("suggest_detail")) {
					
	        	String id = (String)session.getAttribute("login_Id");
	        	if(id == null) {
					forward("login.jsp", req, resp);
				}else {
	        	int seq = Integer.parseInt(sseq);
				 suggestDto dto = dao.getSuggest(seq);
                 req.setAttribute("suggest_dto", dto); forward("suggestDetail.jsp", req, resp);
					
				}
				}else if(detailwork.equals("suggest_update")) {
					
				}else if(detailwork.equals("writeIdcheck")) {
					String id = (String)session.getAttribute("login_Id");
					
					if(id == null) {
						forward("login.jsp", req, resp);
					}else {
					
						forward("suggestwrite.jsp?id="+id, req, resp);
					}
				}
	        
	        else {
					forward("index.jsp", req, resp);
				}
				
				}
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");String id = req.getParameter("id");  
		String work= req.getParameter("work"); String detailwork= req.getParameter("detailwork"); 
		String sseq = req.getParameter("seq"); String title = req.getParameter("title"); String content = req.getParameter("content");
		 suggestDao dao = suggestDao.getInstance();  
	if(work == "suggest") {	
		 if(detailwork == "suggest_write") {
           String a = "";
  // System.out.println("아이디 나오니?"+id);//System.out.println("타이틀도?"+title);//System.out.println("나왔겠지 "+content);
	        boolean isS = dao.writeBbs(new suggestDto(id, title, content));
	        if(isS){
	        	a = "success";
	       	forward("suggest_main.jsp", req, resp);
	        	System.out.println(a);
	       }else{
	           a = "fail";
	         forward("suggetion_main.jsp", req, resp);      
	           }
		 }
		 else if(detailwork == "suggest_delete") {
			 
		 }else if(detailwork=="suggest_update") {
				 int seq = Integer.parseInt(sseq);
				 dao.suggestUpdate(title, content, seq);
				forward("list.jsp", req, resp);
		 }
	}
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher(link);
		dis.forward(req, resp);		
	}
}
