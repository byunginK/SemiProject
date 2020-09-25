<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.InfoDao"%>
<%@page import="dto.InfoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	String id = null;
	int auth = 3; 
	MemberDto mem = null;
	//String id = "a";	// 나중에 수정 1 
	if(session.getAttribute("login_Dto") != null){
	 mem = (MemberDto)session.getAttribute("login_Dto");
	 id = mem.getId(); 	 auth = mem.getAuth();
	}
%>
 	
<%	
	List<InfoDto> list = (List<InfoDto>)request.getAttribute("list");
	Integer len = (Integer)request.getAttribute("len");
	
	String searchWord = ((String)request.getAttribute("searchWord")==null)?"":(String)request.getAttribute("searchWord");
	String choice = ((String)request.getAttribute("choice")==null)?"":(String)request.getAttribute("choice");
 	
 	//String spageNumber = (String)request.getAttribute("pageNumber");
 	Integer pageNumber = pageNumber = (Integer)request.getAttribute("pageNumber");
 			
 	//System.out.println("list = "+list.toString());
 	//System.out.println("len = "+len+" s"+searchWord+" c="+choice+" page "+pageNumber );
%>

<%
//목록 리스트를 검색한것만 가져옴
//10개씩 넘김 
	int bbsPage = len/10;
	if(len % 10 > 0){	
		bbsPage = bbsPage + 1;
	}
%>

<!DOCTYPE html>
<html>
<head>
  <!-- Basic -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
   <meta name="author" content="" />
 
<title>공지사항</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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

</head>

<body class="sub_page">
  <div class="main_body_content">
    <div class="hero_area">
    
     <!-- 헤더 -->
      <header class="header_section">
        <div class="container-fluid">
        <!-- 네비게이션 바 -->
          <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="addPro?work=main">
              Simple Five
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            	<span class=""></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                	<a class="nav-link" href="addPro?work=main">Main<span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                	<a class="nav-link" href="addPro?work=list">카테고리</a>
                </li>
                <li class="nav-item">
                	<div class="dropdown">
						<p class="dropdown-p">고객센터</p>
						<div class="dropdown-content">
							<a href="<%=request.getContextPath()%>/board/qna_main.jsp">Q & A</a>
							<a href="infomain?work=move">공지사항</a>
							<a href="suggest?work=suggest&detailwork=suggest_main" >건의사항</a>
							<a href="<%=request.getContextPath()%>/calendar/cal_main.jsp">일정확인</a>
						</div>
					</div>
                </li>
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
    
    
    
    
    
    
    <!-- 게시판 시작 -->

   <section class="bbs_section layout_padding">
      <div class="container_padding">


		<h1>공지사항</h1>
		

<%-- <h4 class="h4" >
	환영합니다  <%=id %> 님<a href="login.jsp" class="a">&nbsp;&nbsp;로그아웃</a>
</h4> --%>


<%-- <a href="infomain?work=write&id=<%=id %>" class="aTagWrite">글쓰기</a> --%>
<div align="center" class="container">

<table class="table table-hover">
	<col width="70"><col width="600"><col width="100"><col width="100">
	<tr  class="table-header">
		<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
	</tr>
<%
	if(list == null || list.size()==0){//list가 없거나 글이 없을 때
		%>
		<tr class="table-row">
			<td colspan="4" style="text-align: center">작성된 글이 없습니다</td>
		</tr>
		<%
	}else{
		
		for(int i = 0; i < list.size(); i++){
			InfoDto bbs = list.get(i);
		%>
		<tr class="table-row">
			<th><%=i+1 %></th>
			<td onclick="location.href='infomain?work=detail&seq=<%=bbs.getSeq() %>';">
					<%=bbs.getTitle() %>
			</td>
			<td align="center">
				<%=bbs.getId() %>
			</td>
			<td align="center">
				<%=bbs.getWdate() %>
			</td>
		</tr>
		<% 
		}
	}
%>
</table>

<div id="pagelist">
<%
	for(int i=0; i < bbsPage; i++){
		if(pageNumber == i){//1 [2] [3] 
%> 
			<span class='span'>
				<%=i+1 %>
			</span>&nbsp;
			<%
		}else{//그외 페이지
			%>
			<a class="aTagPage" href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)">
			<%=i+1 %>
			</a>&nbsp;
			<%
		}
	}
%> 
</div>

</div>
<div class="div">
<!-- <form action="bbssearch.jsp" method="get"> -->
	<select id="choice" class="bbssearch">
		<option value="sel">---선택</option>
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="writer">작성자</option>
	</select>

	<input type="text" id="search" placeholder="검색어를 입력해주세요" value="<%=searchWord%>" class="bbssearch">
	<button class="btn1" onclick="searchBbs()" value="<%=searchWord%>">검색</button>
<!-- </form> -->
</div>

<!-- 게시판 메인 끝 -->

</div>
</section>








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
                  	고객센터
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
                <a href="<%=request.getContextPath()%>/main/register.jsp">
                  	회원가입
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
                  M. 010-5555-5555
                </span>
              </a>
              <a href="">
                <i class="fa fa-envelope"></i>
                <span>
                  simplefive@gmail.com
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
  
  <!-- jQery -->
  <!-- <script src="../js/jquery-3.4.1.min.js"></script> -->
 <!-- <script type="text/javascript" src ="<%=request.getContextPath() %>/jquery/jquery-3.5.1.min.js"></script>-->
  <!-- bootstrap js -->
  <script src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
  <!-- slick slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
  <!-- custom js -->
  <script src="<%=request.getContextPath() %>/js/custom.js"></script>
  
<script type="text/javascript">
function searchBbs() {
	let choice = document.getElementById("choice").value;
	let word = document.getElementById("search").value;
	
	location.href = "infomain?work=search&searchWord="+word+"&choice="+choice;
}
function goPage(obj) {
	let clickPage = obj;
	let choice = $("#choice").val();
	let search = $("#search").val();
	$.ajax({
		url:"infomain",
		type:"get",
		datatype:"text",
		data:"work=pageList&pageNumber="+clickPage+"&choce='<%=choice%>'&search='<%=searchWord%>'",
		success:function(obj){
			len = obj.len;
			clen = parseInt(len/10);
			
			if (len%10>0) {
				clen = clen +1;
			}
			let liststr = "";
			let list = obj.list;
			
			if (list.length<=0) {
				liststr += "<tr><td colspan='4' style='text-align: center'>작성된 글이 없습니다</td></tr>"
			}else {
				for (var i = 0; i < list.length; i++) {
					liststr +="<tr class='table-row'>";
					liststr +="<th style='text-align: center;'>"+(i+1)+"</th>";
					liststr +="<td onclick='location.href=\"infomain?work=detail&seq="+list[i].seq+"\";'>"+list[i].title+"</td>";
					liststr +="<td align='center'>"+list[i].id+"</td>";
					liststr +="<td align='center'>"+list[i].wdate+"</td>";
					liststr +="</tr>";
					
				}
				let ss="";
				//console.log(clickPage);
				for(var i =0; i<clen; i++){
					if(i==clickPage){
						ss+="<span class='span'>"+(i+1)+"</span>&nbsp;&nbsp;";
					}else{
						ss+= "<a class='aa' href='#none' title='"+(i+1)+"페이지 ' onclick='goPage("+i+")'>"+(i+1)+"</a>&nbsp;&nbsp;";
					}					
				}
				//console.log(ss);
				if($("#pagelist").length>0) $("#pagelist").html(ss);
				
				if($(".table-row").length>0) {
					$(".table-row").remove();
				}
				
				$(".table-header").eq(-1).after(liststr);
			}
		}
	});
}
</script>
</body>
</html>