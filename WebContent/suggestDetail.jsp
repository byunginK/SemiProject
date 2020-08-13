<%@page import="java.util.List"%>
<%@page import="dto.sug_AnswerDto"%>
<%@page import="dto.suggestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
        
    String id = null;
    if(session.getAttribute("login_Id") != null){
 	   id = (String)session.getAttribute("login_Id");
    }
    int answerCount = (Integer)request.getAttribute("answerCount");
    suggestDto dto = (suggestDto)request.getAttribute("suggest_dto");
    List<sug_AnswerDto> list = (List<sug_AnswerDto>)request.getAttribute("a_list");
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

<!---------- 건의사항 상세보기 시작 ----------->
<div align="left">
<a>건의사항(상세보기)</a>
<hr>
</div>
<!-- 건의사항 작성 테이블  시작 -->
<div align="center">
<table border="1">
<col width="100"><col width="150"><col width="100"><col width="250"><col width="100"><col width="120">
<tr ><td colspan="6" align="left"><%=dto.getTitle() %></td></tr>
<tr style="border: none" bgcolor="#CCFFFF"><td>작성자  |</td><td id="id" class="<%=dto.getId() %>"><%=dto.getId() %></td><td>작성일   |</td><td><%=dto.getWdate() %></td><td>조회수   |</td><td><%=dto.getReadcount() %></td></tr>

<tr><td colspan="6" ><textarea rows="10" cols="100" readonly="readonly" style="border: none"><%=dto.getContent() %></textarea> </td></tr>

<tr style="border: none" bgcolor="#CCFFFF">

<!-- 글 수정으로 이동 -->
<td colspan="3" align="left"><button type="button" id="btn" value="수정">글 수정</button></td>

<!-- 글목록으로 이동(suggest_main.jsp) -->
<td colspan="3" align="right"><button type="button" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'">글 목록</button></td>
</tr>
</table>
</div>
<!-- 건의사항 작성 테이블 끝 -->
<br>

<!----- 댓글 시작  ----->
<!-- 글의 seq번호로 댓글 수 체크후 댓글 유무 확인/ 댓글이 있으면 삭제번호를 통해 구별-->
<!-- 관리자 모드에서 게시글 삭제 할때 comment 테이블에 suggest_no에 게시글 seq를 넣으면 게시글 댓글 모두 삭제 -->
<div align="center">
<table>
<col width="100"><col width="150"><col width="100"><col width="250"><col width="100"><col width="120">
<tr id="answerCountAf"><td colspan="6" bgcolor="#FFFFCC" id="countAjax">총 <%=answerCount %>개의 답글이 있습니다</td></tr>
<tr><td colspan="4" ><textarea rows="5" cols="70" id="content"></textarea></td><td></td><td style="float: right" id="btn2"><button type="button" id="answer">답글작성</button></td></tr>
</table>
</div>
<br><br>

<form id="a_frm" method="post">
<!-- 컨트롤러에 보내는 데이터 -->
<input type="hidden" name="work" value="suggest"><input type="hidden" name="detailwork" value="answer_delete">
<div align="center">
<table>
<col width='100'><col width='150'><col width='100'><col width='250'><col width='100'><col width='120'>

<tbody id="answerAf">

<!-- 댓글 작성시 ajax가 뿌려질 위치-->

<%if(answerCount == 0){ %>
<tr><td colspan="6" align="center"><a>작성된 답글이 없습니다.</a></td></tr>
<%}else{ 
for(int i = 0; i < list.size(); i++){
     sug_AnswerDto a_dto = list.get(i);
     if(a_dto.getDel() == 0){
    	%>
    	<tr bgcolor="#FFFFCC"><td colspan="3" align="left" id="a_id"><%=a_dto.getAnswer_Id()%></td><td colspan="3" align="right"><%=a_dto.getAnswer_Wdate() %><a href='#' id="a_delete">[댓글 삭제]</a><a href='#' id="a_update">[댓글 수정]</a></td></tr>
     <tr><td colspan="6"><%=a_dto.getContent() %><input type="hidden" name="seq" value="<%=a_dto.getAnswer_Seq()%>"></td></tr> 
     <%}else{
%>
 <tr bgcolor='#FFFFCC'><td colspan ='3'><%=a_dto.getAnswer_Id() %></td><td colspan='3' align='right'><%=a_dto.getAnswer_Wdate() %></td></tr>
				          <tr><td colspan ='6'>삭제된 댓글입니다</td></tr>
<%}
} 
}%>
</tbody>
</table>
</div>
</form>
<!------- 답글 끝 ------>
<br><br><br><br>
<!------------ 건의사항 상세보기 끝 --------------->

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
  
  <script>

  $(document).ready(function() {
    /* 아이디 확인 후 수정버튼 보이기 */
	  let id = $("#id").attr("class");
	  let id2 = "aaa";
	  if("<%=id%>" != id ){     
		$("#btn").hide();
	  }else{
		  $("#btn").show();
	  }
	 <%--  if("<%=id%>"!= id2){
		  $("#btn2").hide();
	  }	else{
		  $("#btn2").show();
	  }            --%>       
	  /* 클릭 시 해당 버튼 이름 실행 */
  	$("#btn").click(function() {
  		 let btn = $(this).attr("value");
  		if(btn == "수정"){
  			location.href = "suggestUpdate.jsp?seq=<%=dto.getSeq()%>&id=<%=dto.getId()%>&title=<%=dto.getTitle()%>&content=<%=dto.getContent()%>";	
  		}	
  		<%-- else if(btn == "삭제"){ 
            let result = confirm("정말 삭제하시겠습니까?"); if(result){location.href = "suggest?work=suggest&detailwork=suggest_delete&seq=<%=dto.getSeq()%>";} 
            else{ 
            	 
            } 
  		}--%>
  		});
  	/*댓글 작성 시 바로 뿌려주는 AJAX */
$("#answer").click(function() {
	
      let id3 = "<%=id%>"; 
      let content = $("#content").val(); 
      let seq = "<%=dto.getSeq()%>";
 
 	 $.ajax({
		url:"suggest?work=suggest&detailwork=suggest_answer",
		type: "post",
		data:{"content":content, "id":id3, "seq":seq},
		datatype:"json",
		success:(function( datas ) {
		
			let answerCount = datas.map.answerCount;
			var answerList = datas.map.answerList;

			let app ="";
			if(answerCount == 0){
			  app = "<tr><td colspan='6' align='center'><a>작성된 답글이 없습니다.</a></td></tr>";
			}
			else{
			$.each(answerList, function (i, val) {
				if(val.del == 0){
				  app += " <tr bgcolor='#FFFFCC'><td colspan ='3'>"+ val.answer_Id +"</td><td colspan='3' align='right'>"+ val.answer_Wdate +"<a href='#' id='a_btn'>[댓글 삭제]</a><a href='#' id='a_btn'>[댓글 수정]</a></td></tr>"
				    + " <tr><td colspan ='6'>"+ val.content +"</td></tr>";
				}else{
					 app += "<tr bgcolor='#FFFFCC'><td colspan ='3'>"+ val.answer_Id +"</td><td colspan='3' align='right'>"+ val.answer_Wdate +"</td></tr>"
			             +" <tr><td colspan ='6'>삭제된 댓글입니다</td></tr>";
				}
				});
			 $("#answerAf").empty();
			 $('#answerAf').append(app);
			}
			
		})
	
	})	  
  });
/* 댓글 삭제 및 수정 */
$("#a_delete").click(function() {
	let id = $("#a_id").text();
	if(id != "<%=id%>"){
		alert("권한이 없습니다.");
	}else if(id == "<%=id%>"){
	 let result = confirm("삭제하시겠습니까?"); 
	 if(result && id == "<%=id%>"){$("#a_frm").attr("action", "suggest").submit();} 
	 else{ } 	}
});
$("#a_update").click(function() {
	let id = $("#a_id").text();
	if(id != "<%=id%>"){
		alert("권한이 없습니다.");
	}else{
		alert("서비스준비중입니다");
	}
});
});
  </script>
</body>
</html>




















