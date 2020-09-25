<%@page import="dao.InfoDao"%>
<%@page import="dto.InfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	InfoDto dto = (InfoDto)request.getAttribute("dto");
	//System.out.println("dto:"+dto.toString());	
	InfoDao dao = InfoDao.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
 <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script type="text/javascript" src ="<%=request.getContextPath() %>/jquery/jquery-3.5.1.min.js"></script>
  <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" />
</head>
<body>

    <section class="bbs_section layout_padding">
      <div class="container_padding">
      
<form action="infomain" method="get">
 <input type="hidden" name="work" value="updateAf"> 
 <input type="hidden" name="seq" value="<%=dto.getSeq()%>">
<div align="center" class="grp">
<h1>공지사항 수정</h1>
<table id="tb">
	<tr>
		<th class="table-header">작성자</th>
		<td class="table-h"><%=dto.getId() %></td>
	</tr>
	<tr>
		<th class="table-header">작성일</th><td class="table-h"><%=dto.getWdate() %></td>
	</tr>
	<tr>
		<th class="table-header">제목</th>
		<td class="table-h">
		<textarea type="text" name="title"  cols="85" rows="1" style="border: none"><%=dto.getTitle() %></textarea>
		</td>
	</tr>
	<tr>
		<th class="table-header">내용</th>
		<td><textarea class="form-area" id="area" name="content" cols="80" rows="30" required="required"><%=dto.getContent() %></textarea></td>
	</tr>
	
</table>
		<input type="submit" class="btn" value="수정하기">
		<input type="button" class="btn" onclick="location.href ='infomain?work=move'" value="목록으로 돌아가기">
</div>
</form>

</div>
</section>

</body>
</html>
