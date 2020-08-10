<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
    request.setCharacterEncoding("utf-8");
     //MemberDto dto = (MemberDto)session.getAttribute("login_Id");
     //String id = dto.getId()==null?"":dto.getId();
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a{
   text-decoration: none;

}
.bottommenu{
list-style:none;
 }
.topmenuUl {
    list-style:none;
    margin:0;
    padding:0;
}

.topmenuUl li {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
    margin-left: 20px;
}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
</head>
<body>
<!-- 상단헤더 시작 -->
<header style="background-color: pink">
<div style="position: relative; height: 100px;">
<div style="float: left; position: relative;">
<a href=main.jsp>메인</a>
</div>
<div style="float: right; position: relative;">
<div style="float: right; position: relative;">
<%-- if(id == ""){ --%>
<ul style="list-style: none; float: right; right: 500px" class="topmenuUl">
<li><a href="#" id="">회사소개</a></li>
<li><a href="#" id="">카테고리</a></li>
<li><a href="suggest" id="">고객센터</a></li>
<li>
<a href="login.jsp"><b>로그인</b></a>
</li>
<li>
<a href="register.jsp"><b>회원가입</b></a>
</li>
</ul>
<%-- <%}else if (id != ""){ %>

<a href="#"><%=id %></a> &nbsp; 고객님

<%} %> --%>
</div>
</div>
</div>
</header>
<!-- 상단 헤더 종료 -->
<!-- 컨텐츠 시작 -->
<!-- 로그인시작 -->
<br><br><br><br><br><br><br><br><br><br><br><br>
<form method="post">
<div align="center">
<table>
<tr><td align="center"><span>로그인</span></td></tr>
<tr><td><input type="text" name="id" placeholder="아이디" id="id"></td></tr>
<tr><td><input type="password" name="pwd" placeholder="비밀번호" id="pwd"></td></tr>
<tr><td><button type="button" id="btn">로그인</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="btn" onclick="location.href ='register.jsp'">회원가입</button></td></tr>
</table>
</div>
</form>
<!-- 로그인 체크 -->
<script type="text/javascript">
$(document).ready(function() {
	

		$("#btn").click(function () {
			//	alert("btn click");
			let id = $("#id").val();
			let pwd =$("#pwd").val();
			if(id== ""||id.search(/\s/) != -1 ||pwd=="" ||pwd.search(/\s/) != -1){
				alert("공백없이 입력해주세요")
			}else{
				$.ajax({
					type:"post",
					
					url:"login",
				
					data:{ "id":$("#id").val(), "pwd":$("#pwd").val() },
					
					success:function( data ){
			        
						let isS = data.map.isS;
			       
						if( isS == "YES"){
						alert("환영합니다 "+id +" 님");
						location.href = "index.jsp";
						
						}else if(isS == "NO"){
			
						alert("아이디나 비밀번호를 다시한번 확인해주세요");
							
						}			
					},
					error:function(){
						alert("error");
					}
				});
			}
			});
	
});
</script>
<!-- 로그인 종료 -->
<!-- }content -->
<!-- 컨텐츠 종료 -->
<!-- 하단 풋터 시작 -->
<footer>
<div style="position: relative; height: 200px;" >

<div style="position: absolute; bottom: 0px;">
<hr>
<div>여기가 하단입니다</div>
<div>
<ul class="bottommenu">
<li><a href="#">공지를 추가하거나</a></li>
<li><a href="#">회사정보만 추가하거나 정하기</a></li>
<li><a href="#">자동으로 밑으로 밀려남</a></li>
<li><a href="#">임시용이라 허접</a></li>
</ul>
</div>
</div>
<div style="position: absolute; bottom: 0px; ">
<hr>
</div>

<div style="position: absolute; bottom: 0px"></div>


</div>


</footer>
<!-- 하단 풋터 종료 -->
</body>
</html>