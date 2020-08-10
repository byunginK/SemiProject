<%@page import="dto.InfoDto"%>
<%@page import="dao.InfoDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String search = request.getParameter("search");
	//System.out.println(search);
	String txt = request.getParameter("text");

	InfoDao dao = InfoDao.getInstance();
	List<InfoDto> list = dao.getBbsList();
	int seq = 0;
	
	InfoDto dto = null;

	if(search.equals("title")){
		for(int i = 0; i < list.size(); i++){
			InfoDto bbs = list.get(i);
			if(txt.contains(bbs.getTitle())){
				seq = bbs.getSeq();
				//System.out.println(seq);
				dto = dao.getBbs(seq);
			}
		}
	}else if(search.equals("content")){
		for(int i = 0; i < list.size(); i++){
			InfoDto bbs = list.get(i);
			if(txt.contains(bbs.getTitle())){
				seq = bbs.getSeq();
				//System.out.println(seq);
				dto = dao.getBbs(seq);
			}
		}
	}else{
		for(int i = 0; i < list.size(); i++){
			InfoDto bbs = list.get(i);
			if(txt.contains(bbs.getTitle())){
				seq = bbs.getSeq();
				//System.out.println(seq);
				dto = dao.getBbs(seq);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
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
}
  .table-row {
    background-color: #ffffff;
    box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.3);
}
.h4{
	background-color: #f0f0f0;
	 text-align: right;
}
.wri{
	text-align: right;
}
.btn {        
    font-size: 16px;
    font-weight: bold;
	background: gray;
	border: none;
    outline: none !important;
    color: white;
    border-radius: 2px;
    border-radius: 100px;
}
.div{
	text-align: center;
}
</style>
</head>
<body>

<div align="center" class="container">
<table border="1">
<col width="70"><col width="600"><col width="60"><col width="100"><col width="100">
<tr class="table-header">
	<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th><th>작성일</th>
</tr>

		
		<tr class="table-row">
			<th>1</th>
			<td>
				<a href="bbsdetail.jsp?seq=<%=dto.getSeq() %>">
					<%=dto.getTitle() %>
				</a>
			</td>
			<td align="center">
				<%=dto.getId() %>
			</td>
			<td align="center">
				<%=dto.getWdate() %>
			</td>
		</tr>

</table>
</div>
</body>
</html>