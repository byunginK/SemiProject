<%@page import="dto.MemberDto"%>
<%@page import="dao.InfoDao"%>
<%@page import="dto.InfoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Object ologin = session.getAttribute("login");
	MemberDto mem = null;
	
 	if(ologin == null){//session이 날라갔을 때(시간경과 등)
%>
		<script type="text/javascript">
		alert("로그인 해 주십시오");
		location.href = "login.jsp";
		</script>		
<%
 	} 
	mem = (MemberDto)ologin; 
	
	List<InfoDto> list = (List<InfoDto>)request.getAttribute("list");
	int len = (int)request.getAttribute("len");
	String searchWord = request.getParameter("searchWord");
	String choice = request.getParameter("choice");
/* 	int pageNumber = Integer.parseInt(request.getParameter("pageNumber")); */
	
%>

<%-- 
//검색
	String searchWord = request.getParameter("searchWord");
	String choice = request.getParameter("choice");
	
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
--%>
<% 	
	InfoDao dao = InfoDao.getInstance();
	
	//페이지 생성
	String spageNumber = request.getParameter("pageNumber");
	int pageNumber = 0;//현재페이지
	if(spageNumber != null && !spageNumber.equals("")){//하라미터가 넘어왔을때
		pageNumber = Integer.parseInt(spageNumber);
	}
	System.out.println(pageNumber);
	%>	



<%

//목록 리스트를 검색한것만 가져옴

//10개씩 넘김 
	int bbsPage = len/10;
	if(len % 10 > 0){	
		bbsPage = bbsPage + 1;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
table{
	border-collapse: collapse;
	/* max-width: 100%; */
	
}
.span{
	font-size: 15pt;
	color: #0000ff;
	font-weight: bold;
	text-decoration: none;
	text-align: center;
	
}
.aa{
	font-size: 15pt;
	color: #000;
	font-weight: bold;
	text-decoration: none;
	text-align: center;
	tex
	
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
	 text-align: right;
}
.h1{
	background-color: #f0f0f0;
	text-align: center !import;
}
.a{
	text-align: right;
	text-decoration: none;
	font-weight: bold;
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

<h4 class="h4" >
	환영합니다  <%=mem.getId() %> 님<a href="login.jsp" class="a">&nbsp;&nbsp;로그아웃</a>
</h4>
<h1 class="h1">공지사항</h1>

<a href="bbswrite.jsp" class="a">글쓰기</a>
<div align="center" class="container">
<table border="1">
<col width="70"><col width="600"><col width="60"><col width="100"><col width="100">
<tr class="table-header">
	<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
</tr>
<%
	if(list == null || list.size()==0){//list가 없거나 글이 없을 때
		%>
		<tr>
			<td colspan="4" style="text-align: center">작성된 글이 없습니다</td>
		</tr>
		<%
	}else{
		
		for(int i = 0; i < list.size(); i++){
			InfoDto bbs = list.get(i);
		%>
		<tr class="table-row">
			<th><%=i+1 %></th>
			
			<td>
				<%-- <%=arrow(bbs.getDepth()) %> 여백+이미지  --%>
				<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>">
					<%=bbs.getTitle() %>
				</a>
			</td>
			<td align="center">
				<%=bbs.getId() %>
			</td>
			<td align="center">
				<%=bbs.getWdate() %>
			</td>
		</tr>
		<%
		}
	}
%>
</table>


<%
for(int i = 0; i < bbsPage; i++){
	if(pageNumber == i){//1 [2] [3]
		%>
		<span class="span">
			<%=i+1 %>
		</span>&nbsp;
		<%
	}else{//그외 페이지
		%>
		<a class="aa" href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)">
		<%=i+1 %>
		</a>&nbsp;
		<%
	}
}
%>
</div>
<div class="div">
<!-- <form action="bbssearch.jsp" method="get"> -->
	<select id="choice">
		<option value="sel">----------선택해주세요</option>
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="writer">작성자</option>
	</select>

	<input type="text" id="search" placeholder="검색어를 입력해주세요" value="<%=searchWord%>">
	<button class="btn" onclick="searchBbs()" value="<%=searchWord%>">검색</button>
<!-- </form> -->
</div>
<script type="text/javascript">
function write() {
	location.href = "bbswrite.jsp";
}
function searchBbs() {
	let choice = document.getElementById("choice").value;
	let word = document.getElementById("search").value;
	
	location.href = "bbslist.jsp?searchWord=" + word + "&choice="+choice;
}
function goPage(pageNum) {
	location.href = "bbslist.jsp?pageNumber="+pageNum;
}
</script>
</body>
</html>