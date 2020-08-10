<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    request.setCharacterEncoding("utf-8");
    // MemberDto dto = (MemberDto)session.getAttribute("login_Id");
   // String id = request.getParameter("id")==null?"":request.getParameter("id");
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
<!-- content{ -->
<br><br><br><br><br><br><br><br>
<div align="center"><b>MAIN PAGE</b></div>
<!-- }content -->
<!-- 컨텐츠 종료 -->
<!-- 하단 풋터 시작 -->
<footer>
<div style="position: relative; height: 200px;" >

<div style="position: absolute; bottom: 0px;">
<hr>
<div>여기가 하단입니다</div>
<div>
<ul>
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