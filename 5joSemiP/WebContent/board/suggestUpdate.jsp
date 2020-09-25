<%@page import="dto.MemberDto"%>
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
       String su_id = request.getParameter("id");
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

  <title>건의사항 상세페이지</title>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

     <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />
  <!--slick slider stylesheet -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet" />
  
   <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
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
            <a class="navbar-brand" href="../addPro?work=main">
              Simple Five
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            	<span class=""></span>
            </button>
             <div class="collapse navbar-collapse " id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="../addPro?work=main">Main<span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="../addPro?work=list">카테고리</a>
                </li>
                 <!-- 일단 임시로 만들었어요 수정필요  게시판 이동-->
                 <li class="nav-item">
                	<div class="dropdown">
						<p class="dropdown-p">고객센터</p>
						<div class="dropdown-content">
							<a href="<%=request.getContextPath()%>/board/qna_main.jsp">Q & A</a>
							<a href="../infomain?work=move">공지사항</a>
							<a href="../suggest?work=suggest&detailwork=suggest_main" >건의사항</a>
							<a href="<%=request.getContextPath()%>/calendar/cal_main.jsp">일정확인</a>
						</div>
					</div>
                </li>
                 <!-- 게시판 이동 끝 -->
         
          <!--로그인을 하면 세션에 저장 -> 세션값이 없으면 로그인/회원가입  있으면 마이페이지/로그아웃 -->
             <% if(id != null){ 
                     if(auth == 1){%>
                <li class="nav-item">
                  <a class="nav-link" href="<%=request.getContextPath()%>/admin/admin_main.jsp">관리자페이지</a>
                </li>
             <%} else{%>
             <li class="nav-item">
                  <a class="nav-link" href="../login?work=MyPage&id=<%=id%>">My Page</a>
                </li>
                <%} %>
   				<li class="nav-item">
                  <a class="nav-link" href="../login?work=logout">로그아웃</a>
                </li>      
              <%
             }else{ %>
                <li class="nav-item">
                  <a class="nav-link" href="<%=request.getContextPath()%>/main/login.jsp">로그인</a>
                </li>
   				<li class="nav-item">
                  <a class="nav-link" href="<%=request.getContextPath()%>/main/register_agree.jsp">회원가입</a>
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
      
      
      
	      
		<h1>건의 사항 수정하기</h1>   
			

	        <div align="center" class="container">
	        	<table border="1">
					<tr>
			       		<th class="table-header" name="id">작성자</th><td><%=su_id %></td> 
			        </tr> 
					<tr>
			            <th class="table-header">작성일</th><td><textarea type="text" id="title" name="title" cols="85" rows="1" style="border: none"><%=title %></textarea></td>
			        </tr>   
			          
			        <tr>
			        <% String scont = content;
					   scont = scont.replace("<br />", "\n");
					%>
			         	<th class="table-header">내용</th><td><textarea class="form-area" id="area" name="content" required="required"><%=scont%></textarea></td>
			        </tr> 
			          
		        </table>
		          <button type="button" class="btn1" id="add">작성 완료</button>
			      <button type="button" class="btn1" onclick="location.href ='../suggest?work=suggest&detailwork=suggest_main'">목록으로 돌아가기</button>
		        
	        </div>
		        
      




	  </div>
    </section>
<!-------------- 글수정하기   끝 --------------->


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
                <a href="../addPro?work=main">
                  Home
                </a>
                <a href="../addPro?work=list">
                  	카테고리
                </a>
                <a href="../infomain?work=move">
                  	공지사항
                </a>
                <% if(id != null){ 
                     if(auth == 1){%>
                  <a href="<%=request.getContextPath()%>/admin/admin_main.jsp">관리자페이지</a>
            	 <%} else{%>
                  <a href="../login?work=MyPage&id=<%=id%>">My Page</a>
                <%} %>
              <%
             }else{ %>
                  <a href="<%=request.getContextPath()%>/main/login.jsp">로그인</a>
                <%} %>
                <a href="<%=request.getContextPath()%>/main/register_agree.jsp">
                  	회원가입
                </a>
              </div>
            </div>
          </div>

<!-- 회사 -->          
          <div class="col-md-6 col-lg-3">
            <div class="info_detail">
              <h4>
                SimpleFive
              </h4>
              <p>
              	(주)Simple Five<br>대표자: 오조<br><br>
              	사업자 등록번호:520-02-55555<br>
              <!-- 	통신판매업 등록번호 : <br> -->
              	서울특별시 강남구 테헤란로<br> 64번길2 서영빌딩1층
              </p>
            </div>
          </div>
<!-- 고객센터 -->
          <div class="col-md-6 col-lg-3">
            <div class="info_detail">
              <h4>
                CS Center
              </h4>
              <p>
              	이용약관<br>
              	개인정보 취급방침<br>
              	Q & A
              </p>
            </div>
          </div>
<!-- 연락방법 -->
          <div class="col-md-6 col-lg-3">
            <h4>
              	Contect Us
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
                  M. 010-3976-0000
                </span>
              </a>
              <a href="">
                <i class="fa fa-envelope"></i>
                <span>
                  bitcamp5j0@gmail.com
                </span>
              </a>
          	    <span>
                  	평일 : am 09:00 - pm 18:00 <br> 주말 : pm 12:00 - pm 13:00
                </span>
            </div>
          </div>
          <!-- 고객센터 끝 -->
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
 

<!-- 글 수정 시 빈칸여부 확인 -->
<script>
$(document).ready(function() {
	$("#add").click(function() {
		var content = $("#area").val();
		content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');
		if( title =="" || content ==""){
			swal("","빈칸없이 입력해주세요","error");
		}else{
			 swal({
			     title: "건의사항 수정",
			     text: "건의사항을 수정하시겠습니까?",
			     icon: "info", 
			     buttons: true,
			}).then((update) => {
			     if (update) {
			    	 var id = "<%=su_id%>";
			    	 var work = "suggest"; var detailwork = "suggest_update";
			         var title = $("#title").val();  var seq = "<%=seq%>";
			    	  $.ajax({
			    		url:"../suggest",
			    		type:"post",
			    		data:{ "id":id, "title":title, "content":content, "work":work , "detailwork":detailwork, "seq":seq},
			    		success:function(data){
			    			var isS = data.map.isS;

			    			if(isS == "YES"){
			    				swal("건의사항 수정이 완료되었습니다").then(function () {
									location.href = "../suggest?work=suggest&detailwork=suggest_main";
								});
			    			}else{
			    				swal("수정 실패", "해당 현상이 지속되면 고객센터를 통해 문의해주세요","error");
			    			}
			    		} 
			    	 })   
			  
			     }else{
			    	 
			     }
			});
		}
	});	
});
</script>
</body>
</html>




















