<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.InfoDao"%>
<%@page import="dto.InfoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	String id = null;
	//String id = "a";	// 나중에 수정 1 
	System.out.println("id1: "+ session.getAttribute("login_Id"));
	if(session.getAttribute("login_Id") != null){
	  // MemberDto mem = (MemberDto)session.getAttribute("login_Id");
	  id = (String)session.getAttribute("login_Id");
	}
	
	//MemberDao dao = MemberDao.getInstance();
	//MemberDto dto = dao.login("id");
	System.out.println("로그인아이디 받아옴");
	
%>
 	
<%	
	List<InfoDto> list = (List<InfoDto>)request.getAttribute("list");

	int len = (int)request.getAttribute("len");
	String searchWord = (String)request.getAttribute("searchWord");
	String choice = (String)request.getAttribute("choice");
 	int pageNumber = (Integer)request.getAttribute("pageNumber");
 	
 	
 	
 	System.out.println("list = "+list.toString());
 	System.out.println("len = "+len+" s"+searchWord+" c="+choice+" page "+pageNumber );
 	
%>

<% 	
	
	//페이지 생성
	/* 	String spageNumber = request.getParameter("pageNumber");
	int pageNumber = 0;//현재페이지
	if(spageNumber != null && !spageNumber.equals("")){//하라미터가 넘어왔을때
		pageNumber = Integer.parseInt(spageNumber);
	} */
	System.out.println("pageNumber:"+pageNumber);
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
    background-color: #f8ad9d;
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
	환영합니다  <%=id %> 님<a href="login.jsp" class="a">&nbsp;&nbsp;로그아웃</a>
</h4>

<h1 class="h1">공지사항</h1>

<a href="infomain?work=write&id=<%=id %>" class="a">글쓰기</a>
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
				<a href="infomain?work=detail&seq=<%=bbs.getSeq() %>">
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
	for(int i=0; i < bbsPage; i++){
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
function searchBbs() {
	let choice = document.getElementById("choice").value;
	let word = document.getElementById("search").value;
	
	location.href = "infomain?work=search&searchWord="+word+"&choice="+choice;
}
/* function goPage(pageNum) {
	location.href = "infomain?work=pageNum&pageNumber="+pageNumber+"&searchWord="+word+"&choice="+choice;
} */
function goPage(obj) {
	//System.out.println("obj="+obj);
	let clickPage = obj;
	let choice = $("#choice").val();
	let search = $("#search").val();
	$.ajax({
		url:"infomain",
		type:"get",
		datatype:"text",
		data:"work=pageList&pageNumber="+clickPage+"&choce='<%=choice%>'&search='<%=searchWord%>'",
		success:function(obj){
			len = obj.len;
			clen = parseInt(len/10);
			
			if (len%10>0) {
				clen = clen +1;
			}
			let liststr = "";
			let list = obj.list;
			
			if (list.length<=0) {
				liststr += "<tr><td colspan='4' style='text-align: center'>작성된 글이 없습니다</td></tr>"
			}else {
				for (var i = 0; i < list.length; i++) {
					liststr +="<tr class='table-row'>";
					liststr +="<th>"+(i+1)+"</th>";
					liststr +="<td>"+"<a href='infomain?work=detail&seq="+list[i].seq+"'>"+list[i].title+"</a></td>";
					liststr +="<td align='center'>"+list[i].id+"</td>";
					liststr +="<td align='center'>"+list[i].wdate+"</td>";
					liststr +="</tr>";
					
				}
				//console.log(liststr);
				
				if($(".table-row").length>0) $(".table-row").remove();
				
				$(".table-header").eq(-1).after(liststr);
				
<%-- 		<tr class="table-row">
				<th><%=i+1 %></th>
				<td>
					<a href="infomain?work=detail&seq=<%=bbs.getSeq() %>">
					
						<%=bbs.getTitle() %>
					</a>
				</td>
				<td align="center">
					<%=bbs.getId() %>
				</td>
				<td align="center">
					<%=bbs.getWdate() %>
				</td>
			</tr> --%>
			}
		}
	});
	
}
</script>

</body>
</html>