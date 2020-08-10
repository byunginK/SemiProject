<%@page import="dao.InfoDao"%>
<%@page import="dto.InfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	System.out.println(seq);
	
	InfoDao dao = InfoDao.getInstance();
	InfoDto dto = dao.getBbs(seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	border-collapse: collapse;
	
	/* max-width: 100%; */
	
}
.container {
  margin-left: auto;
  margin-right: auto;
  padding-left: 10px;
  padding-right: 10px;
}
 .table-header {
    background-color: #95A5A6;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.03em;
    height: 40px;
    font-size: 16px;
}
  .table-row {
    background-color: #ffffff;
    box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.3);
}
.h2{
	background-color: #f0f0f0;
	 text-align: center;
}
.wri{
	text-align: right;
}
.btn {        
    font-size: 16px;
    font-weight: bold;
	background: gray;
	border: none;
    color: white;
    border-radius: 2px;
    
}
</style>
</head>
<body>
<h2 class="h2">글 수정하기</h2>
<form action="bbsupdateAf.jsp" method="post">
<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
<div align="center" class="container">
<table border="1">
	<tr>
		<th class="table-header">작성자</th><th><%=dto.getId() %></th>
	</tr>
	<tr>
		<th class="table-header">작성일</th><th><%=dto.getWdate() %></th>
	</tr>
	<tr>
		<th class="table-header">제목</th><th><input type="text" name="title" value="<%=dto.getTitle() %> "></th>
	</tr>
	<tr>
		<th class="table-header">내용</th><th><textarea class="form-area" id="area" name="area" cols="80" rows="30" required="required"><%=dto.getContent() %></textarea></th>
	</tr>
	<tr>
		<th colspan="2"><input type="submit" class="btn" value="수정하기"></th>
	</tr>
</table>
</div>
</form>
</body>
</html>