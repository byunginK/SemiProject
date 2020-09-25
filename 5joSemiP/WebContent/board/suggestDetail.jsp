<%@page import="dto.MemberDto"%>
<%@page import="dto.loginDto"%>
<%@page import="dto.sug_AnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.suggestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%=request.getContextPath() %> --%>
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
            <a class="navbar-brand" href="./addPro?work=main">
              Simple Five
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            	<span class=""></span>
            </button>
             <div class="collapse navbar-collapse " id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="./addPro?work=main">Main<span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./addPro?work=list">카테고리</a>
                </li>
                 <!-- 일단 임시로 만들었어요 수정필요  게시판 이동-->
                 <li class="nav-item">
                	<div class="dropdown">
						<p class="dropdown-p">고객센터</p>
						<div class="dropdown-content">
							<a href="<%=request.getContextPath()%>/board/qna_main.jsp">Q & A</a>
							<a href="./infomain?work=move">공지사항</a>
							<a href="./suggest?work=suggest&detailwork=suggest_main" >건의사항</a>
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
                  <a class="nav-link" href="login?work=MyPage&id=<%=id%>">My Page</a>
                </li>
                <%} %>
   				<li class="nav-item">
                  <a class="nav-link" href="login?work=logout">로그아웃</a>
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




<!---------- 건의사항 상세보기 시작 ----------->
    <section class="bbs_section layout_padding">
      <div class="container_padding">
      
      	<h1>건의사항 상세 페이지</h1>
      
      		<div align="center" class="grp">
				<table id="tb">
					<tr>
						<th class="table-header">작성자</th><td class="table-h"><%=dto.getId() %></td>
					</tr>
					<tr>
						<th class="table-header">작성일</th><td class="table-h"><%=dto.getWdate() %></td>
					</tr>
					<tr>
						<th class="table-header">제목</th><td class="table-h"><%=dto.getTitle() %></td>
					</tr>
					<tr>
					<% String scont = dto.getContent();
					   scont = scont.replace("<br />", "\n");
					%>
						<!-- <th class="table-header">내용</th> -->
						<th colspan="2"><textarea readonly="readonly" class="form-area" id="area" name="area" placeholder="내용을 입력해주세요" required="required"><%=scont %></textarea></th>
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
      
		
		</div>
	</section> 
<!-- 상세보기 끝 -->


<!----- 답글 시작  ----->
<div class="container">
	<div class="answer-from">
		<form id="a_frm" method="post">
		<input type="hidden" name="work" value="suggest"><input type="hidden" name="detailwork" value="answer_delete"><input type="hidden" name="seq" value="<%=dto.getSeq()%>">
			<div align="center">
			<!-- max(step) 번호로 댓글 갯수 확인 -->
				<h6 id="answerCount">총 <%=answerCount %>개의 댓글이 있습니다</h6>
			
				
		        
			</div>
			<div align="center">
			<table id="dtb">
			<col width="50"><col width="520" ><col width="200">
            <tr id="reptitle" align="center">
            <th class="table-header" >아이디</th>
            <th class="table-header" >내용</th>
            <th class="table-header">작성일</th>
            <th class="table-header"></th>
            <th class="table-header"></th>
            </tr>
			<tbody id="answerAf">
		<!-- max(step) 번호로 체크후 댓글 유무 확인-->
		<%if(answerCount == 0){ %>
			<tr><th colspan="4">       작성된 댓글이 없습니다.</th></tr>
	<%}else{ 
for(int i = 0; i < list.size(); i++){
     sug_AnswerDto a_dto = list.get(i);
    
    	%>
    	<tr id="<%=a_dto.getAnswer_Seq()%>"><td><a id="a_id"><%=a_dto.getAnswer_Id()%></a></td>
    	<td id="content"><%=a_dto.getContent() %><input type="hidden" name="a_seq" value="<%=a_dto.getAnswer_Seq()%>"></td>
    	<td id="wdate"><a id="wdate_a">(<%=a_dto.getAnswer_Wdate() %>)</a>
    	<input type="hidden" name="a_seq" value="<%=a_dto.getAnswer_Seq()%>" id="a_seq">
    	<td><a id="a_update" style="color: #05dfd7" onclick="update_Answer('<%=a_dto.getAnswer_Id() %>','<%=a_dto.getAnswer_Seq()%>' , '<%=a_dto.getContent()%>')">[수정]</a></td>
    	<td><a id="a_delete" style=" color: #e8505b" onclick="Answer_Del('<%=a_dto.getAnswer_Id()%>', '<%=a_dto.getAnswer_Seq()%>')">[삭제]</a></td>
    	</tr>

<%
} 
}%>
</tbody>
</table>
	</div>
	<br>
	<div align="center">
	<textarea class="answer-area" id="content_text" placeholder="댓글을 입력해주세요."></textarea>
				<div class="form-group">
					<button type="button" class="btn1" id="answer" >댓글 작성</button>
		           <%--  <button type="button" class="btn1" id="answer" onclick="answerUpdate()">댓글 작성</button> --%>
		        </div>
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
                <a href="addPro?work=main">
                  Home
                </a>
                <a href="addPro?work=list">
                  	카테고리
                </a>
                <a href="infomain?work=move">
                  	공지사항
                </a>
                <% if(id != null){ 
                     if(auth == 1){%>
                  <a href="<%=request.getContextPath()%>/admin/admin_main.jsp">관리자페이지</a>
            	 <%} else{%>
                  <a href="login?work=MyPage&id=<%=id%>">My Page</a>
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

  
<script>
function update_Answer( id, seq, content ) {
    content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');
	var id = id;
	var lo_id = "<%=id%>" ;
	
	if(id != lo_id) {
		swal("댓글 수정","본인만 수정 가능합니다.","error");
	}else{
 		window.open('board/su_Answer_Update.jsp?seq='+ seq + '&content='+ content , 'newWindow', 'width=500, height=200 , left=1200, top=600');	 
	}
}

function NewView( id ) {
	
	window.open('main/AnswerList.jsp?id='+ id, 'newWindow', 'width=400, height=500');
}
/* 댓글 삭제 */
function Answer_Del( id, seq ){
	
	var id = id;
	var lo_id = '<%=id%>';
	var su_seq = "<%=dto.getSeq()%>";
	 if(id != lo_id){
		 swal("댓글삭제","본인만 삭제 가능합니다.","error");
	}else{
		var frm = document.getElementById("a_frm");
		 swal({
		     title: "댓글 삭제",
		     text: "삭제하시겠습니까?",
		     icon: "info", 
		     buttons: true,
		}).then((adelete) => {
		     if (adelete) {
		    	 /* frm.setAttribute("action", "suggest");
		        	frm.submit(); */
		       
		        var work = "suggest"; var detailwork = "answer_delete";
		        	$.ajax({
		        		url:"suggest",
		        		type:"post",
		        		data:{ "work":work, "detailwork":detailwork, "a_seq":seq},
		        		success:function(data) {
						      var isS = data.map.isS;
						      if(isS == "YES"){
						    	  swal("삭제되었습니다").then(function () {
						    		  location.href = window.location.href ;
								});
						      }else{
						    	  swal("삭제 실패").then(function () {
						    		 /*  location.href = location.href ; */
								});
						      }	
						}
		        		
		        	})
		     }else{
		    	 
		     }
		});
	}

	} 

  $(document).ready(function() {
    /* 아이디 확인 후 수정버튼 보이기 */
	  let id = "<%=dto.getId()%>";
	  if( id != "<%=id%>"){     
		$("#update").hide();
	  }else{
		  $("#update").show();
	  }
 
	  /* 클릭 시 해당 버튼 이름 실행 */
  	$("#update").click(function() {
  		
  		 content = $("#area").val();
  		 content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');
  		
  		 location.href = "board/suggestUpdate.jsp?seq=<%=dto.getSeq()%>&id=<%=dto.getId()%>&title=<%=dto.getTitle()%>&content=" + content;	
  		
  		});
	  
  
  	/*댓글 작성 시 바로 뿌려주는 AJAX */
 $("#answer").click(function() {
	 content = $("#content_text").val();
	 content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');
      let id3 = "<%=id%>"; 
 
      let seq = "<%=dto.getSeq()%>";
 
      $.ajax({
  		url:"suggest?work=suggest&detailwork=suggest_answer",
  		type: "post",
  		data:{"content":content, "id":id3, "seq":seq},
  		datatype:"json",
  		success:(function( datas ) {
  		
  			var answerCount = datas.map.answerCount;
  			var answerList = datas.map.answerList;

  			var app ="";
  			var count = "총 "+ answerCount +"개의 답글이 있습니다";
  			if(answerCount == 0){
  			  app = "<tr><td colspan='4' align='center'><a>작성된 답글이 없습니다.</a></td></tr>";
  			}
  			else{
  			$.each(answerList, function (i, val) {
  			     var a_con = val.content;
  			     a_con = a_con.replace('<br />', '\n');
  				  app += "<tr id='"+ val.answer_Seq +"'><td><a id='a_id' onclick='NewView('"+ val.answer_Id +"')'>"+ val.answer_Id +"</a></td><td id='content'>"+ a_con +"</td><td><a id='wdate'>("+ val.answer_Wdate +")</a><input type='hidden' name='a_seq' value='"+ val.answer_Seq + "'/></td>"
  		    	        + "<td><a onclick='update_Answer(\""+ val.answer_Id +"\","+ val.answer_Seq +" , \"" + a_con +"\")' style='color: #05dfd7;'>[수정]</a></td><td><a  onclick='Answer_Del(\""+ val.answer_Id +"\"," + val.answer_Seq + ")' style='color: #e8505b;'>[삭제]</a></td></tr><br/><br/>";
  				
  				});
  			
  			$("#answerCount").empty();
  			$('#answerCount').append(count);
  			 $("#answerAf").empty();
  			 $('#answerAf').append(app);
  			$("#content_text").val("");
  			}
  			
  		})	
  	});	  
    });

  });
    
    </script>
  </body>
  </html>



















