<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//System.out.println("id: " + id + ", pwd: " + pwd);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginAf.jsp</title>
</head>
<body>
<%
MemberDao dao = MemberDao.getInstance();
MemberDto mem = dao.login(id, pwd);

if(mem != null && !mem.getId().equals("")){
	//login정보 저장
	session.setAttribute("login", mem);
	session.setMaxInactiveInterval(30 * 60 * 60);
	%>
	
	<!-- login 성공 -->
	<script type="text/javascript">
	alert("안녕하세요 <%=mem.getName() %>님");
	location.href = "./bbslist.jsp";
	</script>
	<%
}else{
	%>
	
	<!-- login 실패 -->
	<script type="text/javascript">
	alert("id나 password를 확인해주세요");
	location.href = "./login.jsp";
	</script>

	<%
}
%>
</body>
</html>