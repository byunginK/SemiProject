<%@page import="dto.loginDto"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%=request.getContextPath() %>
   <%
   String id = null; int auth = 3;
   loginDto login_Dto = null;
    if(session.getAttribute("login_Dto") != null){
 	   login_Dto = (loginDto)session.getAttribute("login_Dto");
 	   id = login_Dto.getId(); auth = login_Dto.getAuth();
    }
   String GetId = request.getParameter("id");
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

  <title>WriteSuggest</title>
 

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!--slick slider stylesheet -->

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet" />
  <!-- slick slider -->
  <!-- <link rel="stylesheet" href="css/slick-theme.css" /> -->
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <!-- <link href="css/responsive.css" rel="stylesheet" /> -->

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
                 
<!-- 일단 임시로 만들었어요 수정필요  게시판 이동-->
              	<li>
                	<a href="#">게시판</a>
            		<ul class="sub">
		                <li>
		                	<a href="#" >공지사항</a>
		               	</li>
		                <li>
		                	<a href="#">Q & A</a>
		                </li>
		          <!-- 혹시 모를 오류를 위해 "return false" 안해도 무방 -->
		               <li>
		               		<a href="#" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'; return false;">건의사항</a>
		               </li>
              		 </ul>
               </li>
                 <!-- 게시판 이동 끝 -->
         
          <!--로그인을 하면 세션에 저장 -> 세션값이 없으면 로그인/회원가입  있으면 마이페이지/로그아웃 -->
             <% if(id != null){ %>
             <li class="nav-item">
                  <a class="nav-link" href="myPageCheck.jsp?id=<%=id%>"><%=id %> 님</a>
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
                 <!-- 로그인 메뉴 끝  --> 
              </ul>

            </div>
          </nav>
        </div>
      </header>
      <!-- 헤더 끝 -->
    </div>
    
<!----------- 건의사항 글쓰기 시작 --------------->
<section class="chocolate_section">
	<div class="container">

		<div class="write-form">
			<h2>게시글 작성</h2> 
			<form method="post" id="frm">
					<!-- 컨트롤러로 보내는 값 -->
			<input type="hidden" name="work" value="suggest"><input type="hidden" value="suggest_write" name="detailwork"><input type="hidden" value="<%=id %>" name="id">
			
			
			<!-- 건의 사항 글쓰기 테이블 시작 -->
			<div class="form-group has-error">
				ID:<p class="form-control"><%=id %> 
	        </div> 
			
			<div class="form-group">
	                     제목 : <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" required="required">
	        </div>   
			
			<div class="for-group">
	         	내용:<textarea class="form-area" id="content" name="content"  placeholder="내용을 입력해주세요" required="required"></textarea>
	        </div> 
	        
	        <div class="form-group">
	            <button type="submit" class="btn btn-primary btn-lg btn-block" id="btn" value="작성">작성 완료</button>
	            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'">목록으로 돌아가기</button>
	        </div>
			
			
	<%-- 		<table border="1">
				<col width="100"><col width="150"><col width="100"><col width="250">
				<tr><td colspan="4"><input type="text" name="title" size="70" placeholder="제목" id="title"></td></tr>
				<tr bgcolor="#CCFFFF"><th>작성자   </th><td colspan="4"><%=id %></td></tr> --%>
				<!-- <tr><td colspan="6" ><textarea rows="10" cols="100" style="border: none" name="content" placeholder="내용" id="content"></textarea> </td></tr> -->
	<!-- 			<tr style="border: none" bgcolor="#CCFFFF">
				글 수정으로 이동
				<td colspan="3" align="left"><button type="submit" id="btn" value="작성">글 작성</button></td>
				글목록으로 이동(suggest_main.jsp)
				<td colspan="3" align="right"><button type="button" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'">글 목록</button></td>
				</tr>
				</table>
				</div> -->
			
			</form>
		</div>
	</div>
</section>
<!--  건의사항 글쓰기 테이블 끝 -->


<!------------ 건의사항 글쓰기 끝 ------------>


    <!-- 바닥글 창 -->
    <section class="info_section layout_padding2">
      <div class="container">
        
        <div class="row info_main_row">
 <!-- Menu -->
          <div class="col-md-6 col-lg-3">
            <div class="info_links">
              <h4>
              	Menu
              </h4>
              <div class="info_links_menu">
                <a href="index.jsp">
                  Home
                </a>
                <a href="detail.jsp">
                  	카테고리
                </a>
                <a href="suggetion.jsp?work=suggest">
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

<!-- 회사 -->          
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
<!-- 고객센터 -->
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

    <!-- 바닥글 끝-->
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
  
  <!-- ajax -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
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
 
 <!-- 글 작성시 빈칸 여부 확인 --> 
<script>
$(document).ready(function() {
	$("#btn").click(function() {
		let title = $("#title").val();  let content = $("#content").val();
		if( title == "" || content == ""){
			alert("모두 작성해주세요");
		}else{
			$("#frm").attr("action", "suggest").submit();
		}	
	});
});

</script> 
 
</body>
</html>





