<%@page import="dto.MemberDto"%>
<%@page import="dto.InfoDto"%>
<%@page import="dao.InfoDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Object ologin = session.getAttribute("login");
	MemberDto mem = null;
	mem = (MemberDto)ologin; 
	InfoDao dao = InfoDao.getInstance();
	List<InfoDto> list = dao.getBbsList();
	
	String id = mem.getId();
	String title = request.getParameter("title");
	String area = request.getParameter("area");
	
	System.out.println(id + title + area);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbswriteAf</title>
</head>
<body>
<%
	boolean result = dao.writeBbs(new InfoDto(id, title, area));
	
	if(result){
%>
	<script type="text/javascript">
		alert("글이 추가되었습니다");
		location.href = "bbslist.jsp";
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert("추가되지 않았습니다");
		location.href = "bbswrite.jsp";
	</script>
<%
	}
%>

</body>
</html>