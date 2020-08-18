<%@page import="dto.MemberDto"%>
<%@page import="dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%=request.getContextPath() %>
    <%
    String id = null; int auth = 3;
    MemberDto login_Dto = null;
     if(session.getAttribute("login_Dto") != null){
  	   login_Dto = (MemberDto)session.getAttribute("login_Dto");
  	   id = login_Dto.getId(); auth = login_Dto.getAuth();
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

  <title>Main Page</title>


  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!--slick slider stylesheet -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet" />
  <!-- slick slider -->
<!--   <link rel="stylesheet" href="css/slick-theme.css" /> --> 
  <!-- font awesome style -->
 <link href="css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <!-- <link href="css/responsive.css" rel="stylesheet" /> -->
</head>

<body>
<!-- 바디 셋팅 -->
  <div class="main_body_content">
    
    
      <!-- 헤더 -->
      <header class="header_section">
        <div class="container-fluid">
        <!-- 네비게이션 바 -->
          <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="index.jsp">
              Simple Five
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            	<span class=""></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="FirstOpen.jsp">Main<span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="addPro?work=list">카테고리</a>
                </li>
                 <!-- 일단 임시로 만들었어요 수정필요  게시판 이동-->
                 <li><a href="#">게시판</a>
            <ul class="sub">
          <li><a href="#" >공지사항</a></li>
         <li><a href="#">Q&A</a></li>
         <!-- 혹시 모를 오류를 위해 "return false" 안해도 무방 -->
          <li><a href="suggest?work=suggest&detailwork=suggest_main" >건의사항</a></li>
        </ul>
        </li>
                 <!-- 게시판 이동 끝 -->
         
          <!--로그인을 하면 세션에 저장 -> 세션값이 없으면 로그인/회원가입  있으면 마이페이지/로그아웃 -->
             <% if(id != null){ %>
             <li class="nav-item">
                  <a class="nav-link" href="newMyPage.jsp?id=<%=id%>"><%=id %> 님</a>
                </li>
   				<li class="nav-item">
                  <a class="nav-link" href="login?work=logout">로그아웃</a>
                </li>
                <%if(login_Dto.getAuth() == 1){%>
                <li class="nav-item">
                  <a class="nav-link" href="#">관리자페이지</a>
                </li>
             <%}
             }else{ %>
                <li class="nav-item">
                  <a class="nav-link" href="login.jsp">로그인</a>
                </li>
   				<li class="nav-item">
                  <a class="nav-link" href="register_agree.jsp">회원가입</a>
                </li>
                <%} %>
                 <!-- 로그인 메뉴 끝  --> 
              </ul>
            </div>
          </nav>
        </div>
      </header>
      <!-- 헤더 끝 -->

<br><br><br>
<div><h2>회원탈퇴</h2><span></span></div>
<hr>
저희 심플파이브는 고객센터를 365일 24시간 운영하고 있습니다.
서비스 이용 중 불편사항은 언제드니 연락주시면, 최선을 다해 해결 되도록 노력하겠습니다.
<hr>
<br><br>
<div>
<table>
<tr><th>회원탈퇴 안내</th></tr>
<tr><td>회원 탈퇴 시 회원님꼐서 보유하셨던 <span style="color: orange;">비현금성 포인트와 마일리지, 회원정보, 거래정보 등은 모두 삭제됩니다</span></td></tr>
<tr><th>회원 탈퇴 후 재가입 시에는 신규 회원 가입으로 처리되며, 탈퇴 전의 회원정보와 거래정보 및 포인트 , 마일리지, 칩, 쿠폰 정보등은 복구되지 않습니다.</th></tr>
</table>
</div>
 
<h1>심플파이브 서비스 이용 중 불편사항을 선책해주세요.(복수선택가능)</h1>
<div>
<table>
<col width="250"><col width="200"><col width="200">
<tr><td><input type="checkbox">상품 다양성/가격품질 불만</td><td><input type="checkbox">교환/환불/품질불만</td><td><input type="checkbox">배송지연</td></tr>
<tr><td><input type="checkbox">이용빈도 낮음</td><td><input type="checkbox">개인정보 유츌</td><td><input type="checkbox">회원특혜/쇼핑혜택 부족</td></tr>
<tr><td><input type="checkbox">A/S불만</td><td><input type="checkbox">쇼핑몰 속도 불만</td><td><input type="checkbox">기타</td></tr>
</table>
</div>
<br><br>
<h1>그 이외에 심플파이브에게 남기고 싶으신 의견이 있으시면 기재해주세요.</h1>
<br><br><br>
<textarea rows="8" cols="150"></textarea>

<br><br><br>
<form method="post" id="frm">
<input type="hidden" name="work" value="deleteMem"><input type="hidden" name="id" value="<%=id%>">
<div align="center"><button type="submit" id="delete">회원 탈퇴하기</button>&nbsp;&nbsp;<button type="button" id="cancle" onclick="location.href='./FirstOpen.jsp'">조금만 더 이용해볼게요!</button> </div>
</form>
<br><br><br><br><br><br>



 

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

</div>
<script>
$(document).ready(function () {
	
	$("#delete").click(function () {
		let result = confirm("탈퇴처리되면 복구가 되지 않습니다. 정말 탈퇴하시겠습니까?");
		if(result){
			$("#frm").attr("action", "member").submit();
			}
		else{
			
		}
		
	});
	
	
});

</script>
</body>
</html>