<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
int phone = Integer.parseInt(request.getParameter("phone"));
String email = request.getParameter("email");

System.out.println(id + pwd + name + email);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
MemberDao dao = MemberDao.getInstance();
boolean result = dao.addMember(new MemberDto(id,pwd,name,phone,email,0));

if(result){
%>
	<script type="text/javascript">
	alert('성공적으로 추가되었습니다');
	location.href = "login.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert('추가되지 않았습니다');
	location.href = "regi.jsp";
	</script>
<%
}
%>

</body>
</html>