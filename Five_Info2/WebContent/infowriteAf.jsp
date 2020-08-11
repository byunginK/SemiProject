<%@page import="dto.MemberDto"%>
<%@page import="dto.InfoDto"%>
<%@page import="dao.InfoDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbswriteAf</title>
</head>
<body>
<%
	boolean result = (boolean)request.getAttribute("isS");

	if(result){
%>
	<script type="text/javascript">
		alert("글이 추가되었습니다");
		location.href = "infomain?work=move";
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert("추가되지 않았습니다");
		location.href = "infomain?work=move";
	</script>
<%
	}
%>

</body>
</html>