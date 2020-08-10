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

  <title>Login</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!--slick slider stylesheet -->

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
        
         <!-- 네비게이션 바 -->
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
    
    
    <!-- 로그인 창 추가 -->
    <section class="contact_section layout_padding">
      <div class="container-fluid">
        <div class="row">
              
				<div class="login-form">
				    <form method="post">
					<h2 class="text-center">로그인</h2>
				<div class="form-group has-error">
					<input type="text" class="form-control" name="id" placeholder="아이디" id="id">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="pwd" placeholder="비밀번호" id="pwd">
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary btn-lg btn-block" id="btn">로그인</button>
			
			
			<!-- 혹시 이거 맘에 안드시면 회원가입은 링크로 만드는 것도 괜춘?할듯요
				예를들면  "아이디가 없으신가요? <a>회원가입</a> 하기" 등등드으드ㅡ으ㅡ~~~~
			 -->
			 
			<!-- <button type="button" class="btn btn-primary btn-lg btn-block" id="btn" onclick="location.href ='register.jsp'">회원가입</button> -->
			<br>
			
			<!-- 이게 깔끔한거 같아요! 체크박스는 불편하시면 없어도 돼요~ -->
			<a href="register.jsp">아이디가 없으신가요?</a><div style="position: relative;"><a style="float: right;">아이디 저장</a><input type="checkbox" id="chk_save_id" style="float: right; margin-top: 5px; margin-right: 3px"></div>
		</div>
			</form>
		</div>
		    </div>
          </div>
    </section>


    <!-- 바닥글 -->
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
                <a href="register_agree.jsp">
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

  <!-- 밑창-->
  <footer class="container-fluid footer_section">
    <div class="container">
      <div class="col-md-11 col-lg-8 mx-auto">
        <p>
          &copy; <span id="displayYear"></span> (주)심플파이브
        </p>
      </div>
    </div>
  </footer>
  <!-- 밑창 끝 -->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- cookie 아이디저장 -->
  <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- slick slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- Google Map -->


		
<!-- 로그인체크 -->
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
				   let user_id = $.cookie("user_id");  
				   if(user_id != null){               
				    $('#id').val( user_id);
				    $('#chk_save_id').attr("checked", "checked");
				    }     
				    $("#chk_save_id").click(function(){
				    	if($('#chk_save_id').is(":checked")){   
				    	if($('#id').val().trim()==""){
				    		alert('아이디를 입력해주세요');
				    			$('#chk_save_id').prop("checked", false);
				    		}else{
				    		$.cookie("user_id", $("#id").val().trim(), { expires:7, path:'/'}) 
				    		}
				    	}
				    	else{
				    		    $.removeCookie("user_id",{path:'/'})
				    	}
				    });

			});
</script>   
              
              
              






</body>

</html>