<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.InfoDao"%>
<%@page import="dto.InfoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	String id = null;
	//String id = "a";	// 나중에 수정 1 
	System.out.println("id1: "+ session.getAttribute("login_Id"));
	if(session.getAttribute("login_Id") != null){
	  id = (String)session.getAttribute("login_Id");
	}
	System.out.println("로그인아이디 받아옴");
	
%>
 	
<%	
	List<InfoDto> list = (List<InfoDto>)request.getAttribute("list");

	int len = (int)request.getAttribute("len");
	String searchWord = (String)request.getAttribute("searchWord");
	String choice = (String)request.getAttribute("choice");
 	int pageNumber = (Integer)request.getAttribute("pageNumber");
 	
 	
 	
 	System.out.println("list = "+list.toString());
 	System.out.println("len = "+len+" s"+searchWord+" c="+choice+" page "+pageNumber );
 	
%>

<% 	
	System.out.println("pageNumber:"+pageNumber);
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
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>공지사항</title>


  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!--slick slider stylesheet -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />

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
        <div class="container-fluid" id="header">
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
                	<a class="nav-link" href="index.jsp">Main<span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                	<a class="nav-link" href="detail.jsp">카테고리</a>
                </li>
                <li class="nav-item">
                	<div class="dropdown">
						<p class="dropdown-p">고객센터</p>
						<div class="dropdown-content">
							<a href="#">Q & A</a>
							<a href="#">공지사항</a>
							<a href="#">건의사항</a>
							<a href="#">일정확인</a>
						</div>
					</div>
                </li>
                <li class="nav-item">
                	<a class="nav-link" href="login.jsp">로그인</a>
                </li>
   				<li class="nav-item">
					<a class="nav-link" href="register.jsp">회원가입</a>
                </li>
              </ul>
            </div>
          </nav>
        </div>
      </header>
      <!-- 헤더 끝 -->
   </div>   











      <!-- 게시판메인 시작 -->
    <section class="bbs_section layout_padding">
      <div class="container_padding">




<%-- <h4 class="h4" >
	환영합니다  <%=id %> 님<a href="login.jsp" class="a">&nbsp;&nbsp;로그아웃</a>
</h4>

<h1 class="h1">공지사항</h1> --%>

<a href="infomain?work=write&id=<%=id %>" class="aTagWrite">글쓰기</a>
<div align="center" class="container">
<table border="1">
	<col width="70"><col width="600"><col width="60"><col width="100"><col width="100">
	<tr class="table-header">
		<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
	</tr>
<%
	if(list == null || list.size()==0){//list가 없거나 글이 없을 때
		%>
		<tr>
			<td colspan="4" style="text-align: center">작성된 글이 없습니다</td>
		</tr>
		<%
	}else{
		
		for(int i = 0; i < list.size(); i++){
			InfoDto bbs = list.get(i);
		%>
		<tr class="table-row">
			<th><%=i+1 %></th>
			<td>
				<a href="infomain?work=detail&seq=<%=bbs.getSeq() %>">
					<%=bbs.getTitle() %>
				</a>
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

<%
	for(int i=0; i < bbsPage; i++){
		if(pageNumber == i){//1 [2] [3] 
%> 
			<span class="span">
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
<div class="div">
<!-- <form action="bbssearch.jsp" method="get"> -->
	<select id="choice">
		<option value="sel">----------선택해주세요</option>
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="writer">작성자</option>
	</select>

	<input type="text" id="search" placeholder="검색어를 입력해주세요" value="<%=searchWord%>">
	<button class="btn" onclick="searchBbs()" value="<%=searchWord%>">검색</button>
<!-- </form> -->
</div>

<!-- 게시판 메인 끝 -->












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
					liststr +="<th>"+(i+1)+"</th>";
					liststr +="<td>"+"<a href='infomain?work=detail&seq="+list[i].seq+"'>"+list[i].title+"</a></td>";
					liststr +="<td align='center'>"+list[i].id+"</td>";
					liststr +="<td align='center'>"+list[i].wdate+"</td>";
					liststr +="</tr>";
					
				}
				if($(".table-row").length>0) $(".table-row").remove();
				
				$(".table-header").eq(-1).after(liststr);
			}
		}
	});
}
</script>
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
   <!-- 밑창끝 -->

  <!-- jQery -->
  <script  src="js/jquery-3.4.1.min.js"></script>
  <!-- bootstrap js -->
  <script  src="js/bootstrap.js"></script>
  <!-- slick slider -->
  <script  src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
  <!-- custom js -->
  <script  src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
  <!-- End Google Map -->

</body>

</html>