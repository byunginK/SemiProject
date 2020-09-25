<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
        String work = null;
         if(request.getParameter("work")!=null){
        	work = request.getParameter("work");	 
         }
    %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Lora&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Yanone+Kaffeesatz&display=swap" rel="stylesheet">
<style type="text/css">
.ttop{
font-family: 'Lora', serif;
font-size: 12px;
}
.top{
font-family: 'Yanone Kaffeesatz', sans-serif;
font-size: 30px;
}
p{
font-size: 10px;
color: red;
margin-right: 70px;
}
h3{
color: #394989;


}
.fpwd{
font-size: 10px;
color: red;
margin-left: 30px;
}
</style>
<meta charset="UTF-8">
<%
if(work.equals("id")){
	%>
	<title>아이디 찾기</title>
	<%}else{ %>
	<title>비밀번호 찾기</title>
	<%} %>

</head>
<body>
<a class="ttop">
              The best design comes from simplicity.
            </a><br>
<a class="top">Simple Five</a>
 
<div align="center">
<%
if(work.equals("id")){
	%>
<h3 class="text-center">아이디 찾기</h3><hr color="#221f3b">
<div style="margin-top: 70px">
<input type="text" placeholder="이메일 " name="email" id="email" onkeyup="enterkey('id')">

&nbsp;<button type="button" id="btn" onclick="find_id()" >찾기</button>
<p>※가입 시 입력하신 이메일입니다</p>
	</div>
<%}else{
%>
<h3 class="text-center">비밀번호  찾기</h3><hr color="#221f3b">
<div style="margin-top: 70px">
<input type="text" placeholder="이메일 " name="email" id="email" onkeyup="enterkey('pwd')">&nbsp;&nbsp;
<input type="text" placeholder="아이디 " name="id" id="id" onkeyup="enterkey('pwd')">
&nbsp;<button type="button" id="btn" onclick="find_pwd()">찾기</button>
<div align="left">
<p class="fpwd">※가입 시 입력하신 이메일입니다</p>
</div>
</div>
<%} %>
</div>
<br>
<div align="right" style="margin-top: 45px">
<a href ="javascript:WinClose();" style="color: #519872;text-decoration: none;">[창닫기]</a>
</div>
  <!-- sweetalert -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <!-- ajax -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<!-- jQery -->
  <script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
  <!-- cookie 아이디저장 -->
  <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- slick slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- Google Map -->
  
<script>

function find_id() {
	 
	$("#result").empty();
	let email = $("#email").val();
	if(email ==""){
		swal("", "공백 없이 입력해주세요","warning");
	}else{
	$.ajax({
		url:"../member?work=id_Find&email="+email,
		type:"get",
		datatype:"json",
		success:(function(datas){
		let f_email = datas.map.f_email;
		let app ="";
		if(f_email == "no"){
		 swal("아이디 찾기","일치하는 아이디가 없습니다","error");
		}else{
		 swal("아이디 찾기","찾으시는 아이디는 '"+ f_email+"' 입니다","success");	 
		}

		})
	})
	}	
	 
}
function find_pwd() {
	
	$("#result").empty();
	let email = $("#email").val();
	let id = $("#id").val();
	
	if(email =="" || id ==""){
		swal("", "공백 없이 입력해주세요","warning");
	}else{
	$.ajax({
		url:"../member?work=pwd_Find&email="+ email +"&id="+ id,
		type:"get",
		datatype:"json",
		success:(function(datas){
		let f_pwd = datas.map.f_pwd;
		let app ="";
		if(f_pwd == "no"){
			 swal("비밀번호 찾기","일치하는 비밀번호가 없습니다","error");
		}else{
		 swal("비밀번호 찾기","찾으시는 비밀번호는"+f_pwd+" 입니다","success");	 
		}
		    
		})
	})
	}
	
}

function enterkey(work) {
	if (window.event.keyCode == 13 && work == "id") {
		find_id();
	}else if(window.event.keyCode == 13 && work == "pwd"){
		find_pwd();
	}
}


/* 퀵메뉴 창닫기 기능 */ 

function WinClose()

 {
  window.open('','_self').close();     
}


</script>
</body>
</html>


























