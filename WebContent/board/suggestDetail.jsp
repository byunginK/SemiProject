ss<%@page import="dto.MemberDto"%>
<%@page import="dto.loginDto"%>
<%@page import="dto.sug_AnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.suggestDto"%>
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
    int answerCount = (Integer)request.getAttribute("answerCount");
    suggestDto dto = (suggestDto)request.getAttribute("suggest_dto");
    List<sug_AnswerDto> list = (List<sug_AnswerDto>)request.getAttribute("a_list");
    %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table{
	border-collapse: collapse; 
	/* max-width: 100%; */
}
.table-header {
    background-color: #95A5A6;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.03em;
}
</style>
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

<!---------- 건의사항 상세보기 시작 ----------->
    <section class="bbs_section layout_padding">
      <div class="container_padding">
      
      
      
      		<div align="center" class="container">
				<table border="1">
					<tr>
						<th class="table-header">작성자</th><th><%=dto.getId() %></th>
					</tr>
					<tr>
						<th class="table-header">작성일</th><th><%=dto.getWdate() %></th>
					</tr>
					<tr>
						<th class="table-header">제목</th><th><%=dto.getTitle() %></th>
					</tr>
					<tr>
						<th class="table-header">내용</th><th><textarea readonly="readonly" class="form-area-bbs" id="area" name="area" cols="80" rows="30" placeholder="내용을 입력해주세요" required="required"><%=dto.getContent() %></textarea></th>
					</tr>
				</table>
					<%
						if(dto.getId().equals(id)){//작성자와 로그인id가 같을때만 수정하게해라(다를경우 수정,삭제 버튼 비공개) 
					%>
				<button type="button" class="btn" id="update" value="수정">수정 하기</button>
					<%
						}
					%>
			<button type="button" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'" class="btn">목록으로 돌아가기</button>
			
			</div>
      
      
      
      
      
<%-- 			<h2 class="h2">건의사항(상세보기)</h2>
			<p>작성일 : <%=dto.getWdate() %> | 조회수 : <%=dto.getReadcount() %></p> 
			<form>
				<div class="form-group has-error">
					ID:<p class="form-control" id="id"><%=dto.getId() %></p>
		        </div> 
				
				<div class="form-group">
		                     제목 : <input type="text" class="form-control" id="title" name="title" placeholder="<%=dto.getTitle() %>" readonly="readonly">
		        </div>   
				
				<div class="form-group">
		         	내용:<textarea class="form-area" name="content"  placeholder="<%=dto.getContent() %>" readonly="readonly"></textarea>
		        </div> 
		        
		        <div class="form-group">
		            <button type="button" class="btn btn-primary btn-lg btn-block" id="update" value="수정">수정 하기</button>
		            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'">목록으로 돌아가기</button>
		        </div>
			</form> --%>
		
		
	</div>
</section> 




<!----- 답글 시작  ----->
<div class="container">
	<div class="answer-from">
		<form id="a_frm" method="post">
		<input type="hidden" name="work" value="suggest"><input type="hidden" name="detailwork" value="answer_delete"><input type="hidden" name="seq" value="<%=dto.getSeq()%>">
			<div align="center">
			<!-- max(step) 번호로 댓글 갯수 확인 -->
				<h6 id="answerCount">총 <%=answerCount %>개의 댓글이 있습니다</h6>
			
				<textarea class="answer-area" id="content" ></textarea>
				<div class="form-group">
		            <button type="button" class="btn1" id="answer">답글 작성</button>
		        </div>
		        
			</div>
			<div  align="center">
			<table>
			<col width="800">
			<tbody id="answerAf">
		<!-- max(step) 번호로 체크후 댓글 유무 확인-->
		<%if(answerCount == 0){ %>
			<tr><th>       작성된 댓글이 없습니다.</th></tr>
	<%}else{ 
for(int i = 0; i < list.size(); i++){
     sug_AnswerDto a_dto = list.get(i);
     if(a_dto.getDel() == 0){
    	%>
    	<tr class="table-header"><td><a id="a_id"><%=a_dto.getAnswer_Id()%></a><a>(<%=a_dto.getAnswer_Wdate() %>)</a>
    	  <a href='#' id="a_delete" style="float: right;">[댓글 삭제]</a><a href='#' id="a_update" style="float: right;">[댓글 수정]</a></td></tr>
       <tr><td style="background-color: #f7f2e7; height: 45px"><%=a_dto.getContent() %><input type="hidden" name="a_seq" value="<%=a_dto.getAnswer_Seq()%>"></td></tr>
     <%}else{
%>
<tr class="table-header"><td><%=a_dto.getAnswer_Id()%><a>(<%=a_dto.getAnswer_Wdate() %>)</a></td></tr>
				   <tr><td style="background-color: #f7f2e7; height: 45px"><a>삭제된 댓글입니다</a></td></tr>    
<%}
} 
}%>
</tbody>
</table>
	</div>
		</form>
	
	</div>
</div>

<!------- 답글 끝 ------>
<br><br><br><br>
<!------------ 건의사항 상세보기 끝 --------------->




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

  $(document).ready(function() {
    /* 아이디 확인 후 수정버튼 보이기 */
	  let id = "<%=dto.getId()%>";
	  if( id != "<%=id%>"){     
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
  	$("#update").click(function() {
  		
  		
  		location.href = "board/suggestUpdate.jsp?seq=<%=dto.getSeq()%>&id=<%=dto.getId()%>&title=<%=dto.getTitle()%>&content=<%=dto.getContent()%>";	
  		
  		<%-- else if(btn == "삭제"){ 
            let result = confirm("정말 삭제하시겠습니까?"); if(result){location.href = "suggest?work=suggest&detailwork=suggest_delete&seq=<%=dto.getSeq()%>";} 
            else{ 
            	 
            } 
  		}--%>
  		});
	  
  	/* 댓글 삭제 및 수정 */
  	$("#a_delete").click(function() {
  		let id = $("#a_id").text();
  		alert(id);
  		 if(id != "<%=id%>"){
  			alert("권한이 없습니다.");
  		}else if(id == "<%=id%>"){
  		 let result = confirm("삭제하시겠습니까?"); 
  		 if(result && id == "<%=id%>")
  		 {$("#a_frm").attr("action", "../suggest").submit();} 
  		 else{ alert(id);} 	} 
  	});
  	$("#a_update").click(function() {
  		let id = $("#a_id").text();
  		if(id != "<%=id%>"){
  			alert("권한이 없습니다.");
  		}else{
  			alert("서비스준비중입니다");
  		}
  	}); 
	  
  	/*댓글 작성 시 바로 뿌려주는 AJAX */
$("#answer").click(function() {
	content = $("#content").val();
      let id3 = "<%=id%>"; 
 
      let seq = "<%=dto.getSeq()%>";
 
 	 $.ajax({
		url:"../suggest?work=suggest&detailwork=suggest_answer",
		type: "post",
		data:{"content":content, "id":id3, "seq":seq},
		datatype:"json",
		success:(function( datas ) {
		
			let answerCount = datas.map.answerCount;
			var answerList = datas.map.answerList;

			let app ="";
			let count = "총 "+ answerCount +"개의 답글이 있습니다"
			if(answerCount == 0){
			  app = "<tr><td colspan='6' align='center'><a>작성된 답글이 없습니다.</a></td></tr>";
			}
			else{
			$.each(answerList, function (i, val) {
				if(val.del == 0){
				  app += " <div style='background-color: #99CCCC'>" +val.answer_Id +"<a>("+ val.answer_Wdate +")</a>"
				         + "<a href='#' id='a_delete'>[댓글 삭제]</a><a href='#' id='a_update'>[댓글 수정]</a></div>"
			             + "<div style='background-color: #f7f2e7; height: 45px'>"+ val.content +"</div><input type='hidden' name='seq' value='"+ val.answer_Seq +"'><br><br>";
				}else{
					 app += "<div style='background-color: #99CCCC'>" +val.answer_Id +"<a>("+ val.answer_Wdate +")</a>"
			             +" <div style='background-color: #f7f2e7; height: 45px'><a>삭제된 댓글입니다</a></div>";
				}
				});
			$("#answerCount").empty();
			$('#answerCount').append(count);
			 $("#answerAf").empty();
			 $('#answerAf').append(app);
			}
			
		})	
	})	  
  });

});
  </script>
</body>
</html>



















