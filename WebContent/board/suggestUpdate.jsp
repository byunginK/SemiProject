<<<<<<< HEAD:WebContent/board/suggestUpdate.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%=request.getContextPath() %>
    <%
       String id = request.getParameter("id");
       String title = request.getParameter("title");
       String content = request.getParameter("content");
       String sseq = request.getParameter("seq");
       int seq = Integer.parseInt(sseq);
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
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />
  <!--slick slider stylesheet -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet" />
  <!-- slick slider -->
  <!-- <link rel="stylesheet" href="css/slick-theme.css" /> --> 
  <!-- font awesome style -->
  <link href="<%=request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" />
  <!-- responsive style -->

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
                  <a class="nav-link" href="FirstOpen.jsp">Main<span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="detail.jsp">카테고리</a>
                </li>
                  <!-- 일단 임시로 만들었어요 수정필요  게시판 이동-->
                 <li><a href="#">게시판</a>
            <ul class="sub">
               <li><a href="#" >공지사항</a></li>
                  <li><a href="#">Q&A</a></li>
          <!-- 혹시 모를 오류를 위해 "return false" 안해도 무방 -->
               <li><a href="#" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'; return false;">건의사항</a></li>
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







<!---------------- 글 수정하기 시작 -------------->

    <section class="bbs_section layout_padding">
      <div class="container_padding">
      
      
      
	      
			<h2>건사(수정)</h2>   
	   		 <form method="post" id="frm">
	        <input type="hidden" value="suggest" name="work"><input type="hidden" value="suggest_update" name="detailwork"><input type="hidden" value="<%=seq %>" name="seq">
	        
	        
	        
			<div class="form-group has-error">
	       		ID:<p class="form-control" name="id"><%=id %> 
	        </div> 
			<div class="form-group">
	                     제목 : <input type="text" class="form-control" id="title" name="title" required="required" value="<%=title%>">
	        </div>   
	          
	        <div class="form-group">
	         	내용:<textarea class="form-area-bbs" id="area" name="content" value="<%=title%>" required="required"></textarea>
	        </div> 
	        <div class="form-group">
	            <button type="submit" class="btn btn-primary btn-lg btn-block" id="add">작성 완료</button>
	            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'">목록으로 돌아가기</button>
	        </div>
	        
		        
		    </form>
      
<%-- <!-- <!-- 글 수정 작성 테이블 시작 -->
<form method="post" id="frm" > -->
<!-- 컨트롤러에 보내는 값 -->
<input type="hidden" value="suggest" name="work"><input type="hidden" value="suggest_update" name="detailwork"><input type="hidden" value="<%=seq %>" name="seq">

<div align="center">
<div style="margin-left: 20px">
<!-- 아이디 고정 수정 안됨 -->
ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="50" name="id" value="<%=id%>" readonly="readonly"></div><br><br>

제목:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="50" name="title" value="<%=title%>"><br><br>
<div style="margin-right: 420px">
건의내용:<br><br>
</div>
<textarea name="content" style="height: 500px; width: 500px;"><%=content %></textarea><br><br>

<!-- 글 목록으로 이동 버튼 -->
<button type="button" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'">글 목록</button>

<!-- 수정 완료 버튼(ajax) -->
<button type="submit" id="add" >수정완료</button>
</div>
</form>
<!-- 글 수정 작성 테이블 끝 --> --%>



		</div>
    </section>
<!-------------- 글수정하기   끝 --------------->








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

<!-- 글 수정 시 빈칸여부 확인 -->
<script>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
       String id = request.getParameter("id");
       String title = request.getParameter("title");
       String content = request.getParameter("content");
       String sseq = request.getParameter("seq");
       int seq = Integer.parseInt(sseq);
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
                  <!-- 일단 임시로 만들었어요 수정필요  게시판 이동-->
                 <li><a href="#">게시판</a>
            <ul class="sub">
               <li><a href="#" >공지사항</a></li>
                  <li><a href="#">Q&A</a></li>
          <!-- 혹시 모를 오류를 위해 "return false" 안해도 무방 -->
               <li><a href="#" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'; return false;">건의사항</a></li>
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

<!---------------- 글 수정하기 시작 -------------->
<div align="center">
<h1>건사(수정)</h1>
</div>
<!-- 글 수정 작성 테이블 시작 -->
<form method="post" id="frm" >

<!-- 컨트롤러에 보내는 값 -->
<input type="hidden" value="suggest" name="work"><input type="hidden" value="suggest_update" name="detailwork"><input type="hidden" value="<%=seq %>" name="seq">

<div align="center">
<div style="margin-left: 20px">
<!-- 아이디 고정 수정 안됨 -->
ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="50" name="id" value="<%=id%>" readonly="readonly"></div><br><br>

제목:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="50" name="title" value="<%=title%>"><br><br>
<div style="margin-right: 420px">
건의내용:<br><br>
</div>
<textarea name="content" style="height: 500px; width: 500px;"><%=content %></textarea><br><br>

<!-- 글 목록으로 이동 버튼 -->
<button type="button" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'">글 목록</button>

<!-- 수정 완료 버튼(ajax) -->
<button type="submit" id="add" >수정완료</button>
</div>
</form>
<!-- 글 수정 작성 테이블 끝 -->
<!-------------- 글수정하기   끝 --------------->
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

<!-- 글 수정 시 빈칸여부 확인 -->
<script>
>>>>>>> f982e6c7156f923d7a831a301fdbc28d99c1bedb:WebContent/suggestUpdate.jsp
$(document).ready(function() {
	$("#add").click(function() {
		let title = $("#title").val(); let content = $("#content").val()
		if( title =="" || content ==""){
			alert("빈칸없이 입력해주세요");
		}else{
			let result = confirm("수정하시겠습니까?"); if(result){$("#frm").attr("action","suggest").submit();}else{}
		}
	});	
});
</script>
</body>
</html>





















