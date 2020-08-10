<%@page import="dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
    String id = null;
    if(session.getAttribute("login_Id") != null){
 	   id = (String)session.getAttribute("login_Id");
    }
    %>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Register</title>


  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!--slick slider stylesheet -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet" />
  <!-- slick slider -->

  <link rel="stylesheet" href="css/slick-theme.css" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

</head>

<!-- 바디 셋팅 -->
<body class="sub_page">

  <div class="main_body_content">

    <div class="hero_area">
    
      <!-- 헤더 -->
       <header class="header_section">
        <div class="container-fluid">
          <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="index.jsp">
              Simple Five
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class=""> </span>
            </button>

            <div class="collapse navbar-collapse " id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp">Main<span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="detail.jsp">카테고리</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="contact.jsp">고객센터</a>
                </li>
             
                <% if(id != null){ %>
             <li class="nav-item">
                  <a class="nav-link" href="mypage.jsp?id=<%=id%>"><%=id %> 님</a>
                </li>
   				<li class="nav-item">
                  <a class="nav-link" href="login?work=logout">로그아웃</a>
                </li>
             <%}else{ %>
                <li class="nav-item">
                  <a class="nav-link" href="login.jsp">로그인</a>
                </li>
   				<li class="nav-item">
                  <a class="nav-link" href="register_agree.jsp">회원가입</a>
                </li>
                <%} %>
              </ul>
              
            </div>
          </nav>
        </div>
      </header>
      <!-- 헤더 끝 -->
    </div>

  <!-- 회원가입창 -->

    <section class="contact_section layout_padding">
        	<div class="regi-form2">
					<form id="frm">
					
							<h2>회원 가입</h2>
						<div class="form-group">
							<input type="text" class="form-control" name="id" placeholder="아이디" maxlength="20" id="id"><input type="button" class="btn1" id="btn" value="중복체크">
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control" name="pwd" placeholder="비밀번호" maxlength="25" id="pwd">
						</div>
						<div class="form-group">
						</div>	
							<input type="text" class="form-control" name="name" placeholder="이름" id="name">
						<div class="form-group">
						</div>
							<input type="text" class="form-control" name="phone" placeholder="휴대폰번호" maxlength="11" id="number">
						<div class="form-group">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="email" placeholder="이메일" id="email">
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-primary btn-lg btn-block" id="regi">회원가입</button>
						</div>
					</form>
				</div>
    </section>
    <!-- 회원가입 끝 -->



    <!-- 바닥글-->
   <section class="info_section layout_padding2">
      <div class="container">
        <div class="row info_main_row">
          <div class="col-md-6 col-lg-3">
            <div class="info_links">
              <h4>
              	Menu
              </h4>
              <div class="info_links_menu">
                <a href="index.jsp">
                  Home
                </a>
                <a href="#">
                  	카테고리
                </a>
                <a href="contact.jsp">
                  	고객센터
                </a>
                <a href="login.jsp">
                  	로그인
                </a>
                <a href="register.jsp">
                  	회원가입
                </a>
              </div>
            </div>
          </div>
          
          <div class="col-md-6 col-lg-3">
            <div class="info_detail">
              <h4>
                Company
              </h4>
              <p class="mb-0">
              	(주)Simple Five<br>대표자: 오조<br><br>
              	사업자 등록번호:520-02-55555<br>
              <!-- 	통신판매업 등록번호 : <br> -->
              	서울특별시 강남구 테헤란로 64번길 2 서영빌딩 1층
              </p>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <h4>
              	CS Center
            </h4>
            <div class="info_contact">
              <a href="">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <span>
                  	T. 02-223-5555
                </span>
              </a>
              <a href="">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>
                  M. 010-5555-5555
                </span>
              </a>
              <a href="">
                <i class="fa fa-envelope"></i>
                <span>
                  demo@gmail.com
                </span>
              </a>
          	    <span>
                  	평일 : am 09:00 - pm 18:00 <br>/ 주말: pm 12:00 - pm 13:00
                </span>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- 바닥글 끝 -->

  </div>

  <!-- 밑창 -->
  <footer class="container-fluid footer_section">
    <div class="container">
      <div class="col-md-11 col-lg-8 mx-auto">
        <p>
          &copy; <span id="displayYear"></span> (주)심플파이브
        </p>
      </div>
    </div>
  </footer>
  <!-- footer section -->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- slick slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>


<!-- 회원가입 관련 체크시작 -->
<script type="text/javascript">


$(document).ready(function () {
	
	
	 $("#btn").click(function () {
	//	alert("btn click");
	
	let id = $("#id").val();
	if(id == null || id == "" || id.search(/\s/) != -1){
		
		alert("공백없이 입력해주세요")
	}else{
		$.ajax({
			type:"post",
			
			url:"addmember",
		
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
	 $.fn.CheckFunction = function() {
			
		 /* 비밀번호  */
		 let pwd = $("#pwd").val();   	
		 let num = pwd.search(/[0-9]/g);
		 let eng = pwd.search(/[a-z]/ig);
		 let spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		 /* 이름 */
		 let name = $("#name").val(); 
		 let num_name = name.search(/[0-9]/g);
		 let spe_name = name.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		 /* 이메일 */
		 let email = $("#email").val(); 
		
		 /* 전화전호 */
		 let number = $("#number").val();
		 let num_number = number.search(/[a-z]/ig);
		// let spe_number = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		 

		 if(pwd.length < 8 || pwd.length > 20){
			 alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
		   }else if(pwd.search(/\s/) != -1){
		    alert("비밀번호는 공백 없이 입력해주세요.");
		 }else if(num < 0 || eng < 0 || spe < 0 ){
            alert("비밀반호를 영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		 }else if(name == "" || name.search(/\s/)!= -1){ 
			 alert("이름을 공백 없이 입력해주세요.");
		 }else if(num_name != -1 || spe_name != -1){
			 alert("이름에 숫자, 특수문자가 포함되어있습니다.");
		 }
		 else if( number.search(/\s/) != -1 || number == ""){
			 alert("휴대폰 번호는 공백 없이 입력해주세요.");
		 }else if( num_number != -1 ){
			 alert("휴대폰 번호는 숫자만 입력해주세요");
		 }else{
		     alert("가입을 축하드립니다");
			 $("#frm").attr("action", "addmember").submit(); 
		 }

  }	
$("#regi").click(function() {
	
      $.fn.CheckFunction();

 
});
	
});
</script>
<!-- 회원가입 체크 끝 -->

</body>

</html>