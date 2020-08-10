<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
   // MemberDto dto = (MemberDto)session.getAttribute("login_Id");
   // String id = dto.getId()==null?"":dto.getId();
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
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
<!-- 회원가입 시작-->
<div align="center">

<textarea style="height: 100px; width: 200px"></textarea>
</div>
<div align="center">
<form method="post" action="addmember" id="frm">

회원가입
<input type="text" name="id" placeholder="아이디" maxlength="20" id="id"><button type="button" id="btn">중복체크</button>
<input type="text" name="pwd" placeholder="비밀번호" maxlength="25" id="pwd">
<input type="text" name="name" placeholder="이름">
<input type="text" name="phone" placeholder="휴대폰번호" maxlength="11">
<input type="text" name="email" placeholder="이메일">
<button type="button" id="regi">회원가입</button>

</form>
</div>

<!-- 회원가입 중복체크& 비밀번호 체크 -->
<script type="text/javascript">


$(document).ready(function () {

	 $.fn.myFunction = function() {
		  
		 let pwd = $("#pwd").val();
		 let num = pwd.search(/[0-9]/g);
		 let eng = pwd.search(/[a-z]/ig);
		 let spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		 if(pwd.length < 8 || pwd.length > 20){

		  alert("8자리 ~ 20자리 이내로 입력해주세요.");
		  
		 }else if(pwd.search(/\s/) != -1){
		 
			 alert("비밀번호는 공백 없이 입력해주세요.");
		  
		
		 }else if(num < 0 || eng < 0 || spe < 0 ){
		
			 alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		  
		
		 }else {
			 
			$("#frm").attr("action", "addmember").submit(); 
		  
		 }

  }	
	 $("#btn").click(function () {
	//	alert("btn click");
	let id = $("#id").val();
	if(id == null || id == "" || id.search(/\s/) != -1){
		alert("공백없이 입력해주세요")
	}else{
		$.ajax({
			type:"get",
			
			url:"addmember?work=newadd",
		
			data:{ "id":$("#id").val() },
			
			success:function( data ){
	        
				let isS = data.map.isS;
	       
				if( isS == "YES"){
				
				alert("사용할 수 있는 id입니다");
				
				}else if(isS == "NO"){
	
				alert("사용할 수 없는 id입니다");
					
				}			
			},
			error:function(){
				alert("error");
			}
		});
	}
	}); 
$("#regi").click(function() {
	
      $.fn.myFunction();

 
});
	
});
</script>
<!-- 회원가입 끝 -->
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