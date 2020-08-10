<%@page import="dao.InfoDao"%>
<%@page import="dto.InfoDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	Object ologin = session.getAttribute("login");
	MemberDto mem = null;
	mem = (MemberDto)ologin;
	InfoDao dao = InfoDao.getInstance();
	List<InfoDto> list = dao.getBbsList();
	
	int seq = Integer.parseInt(request.getParameter("seq"));
	String title = request.getParameter("title");
	String area = request.getParameter("area");
	
	System.out.println(seq + title + area);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	boolean result = dao.updateBbs(seq, title, area);
	
	if(result){
%>
	<script type="text/javascript">
		alert("글이 수정되었습니다");
		location.href = "bbslist.jsp";
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert("수정되지 않았습니다");
		location.href = "bbslist.jsp";
	</script>
<%
	}
%>
</body>
</html>