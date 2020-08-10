package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InfoDao;
import dao.MemberDao;
import dto.InfoDto;
import dto.MemberDto;

@WebServlet("/listcontroller")
public class listController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String work = req.getParameter("work");
		
		if(work.equals("move")) {
			
			String id = req.getParameter("id");
			System.out.println("id:" + id);
			
			//검색
			String searchWord = req.getParameter("searchWord");
			String choice = req.getParameter("choice");
			
			if(choice == null || choice.equals("")){
				choice = "sel";
			}
			 
		//검색어를 지정하지 않고 choice가 넘어왔을 때
			if(choice.equals("sel")){
				searchWord = "";//null->""로 변경해줌(=new String())
			}
			if(searchWord == null){
				searchWord = "";
				choice = "sel";//select에서 "------선택"으로 돌아가기
			}
			
			
			InfoDao dao = InfoDao.getInstance();
			
			//페이지 생성
			String spageNumber = req.getParameter("pageNumber");
			int pageNumber = 0;//현재페이지
			if(spageNumber != null && !spageNumber.equals("")){//하라미터가 넘어왔을때
				pageNumber = Integer.parseInt(spageNumber);
			}
			System.out.println(pageNumber);
			
			List<InfoDto> list = dao.getBbsPagingList(choice, searchWord, pageNumber);
			
			//목록 리스트를 검색한것만 가져옴
			int len = dao.getAllBbs(choice, searchWord);
			System.out.println(len);
			
			
			
			
			// 보내줄 데이터
			req.setAttribute("list", list);
			req.setAttribute("len", len);
			req.setAttribute("choice", choice);
			req.setAttribute("searchWord", searchWord);
			// 이동
			forward("bbslist.jsp", req, resp);
			
		}		
		else if(work.equals("detail")) {

		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher(link);
		dis.forward(req, resp);		
	}
	
	public void search() {
		
	}
}
