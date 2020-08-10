<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	MemberDao dao = MemberDao.getInstance();
	boolean b = dao.getId(id);
	
	if(b == true){
		out.print("No");
	}else{
		out.print("Yes");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>