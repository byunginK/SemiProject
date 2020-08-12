<%@page import="dto.MemberDto"%>
<%@page import="dao.suggestDao"%>
<%@page import="dto.suggestDto"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%request.setCharacterEncoding("utf-8"); %>
     <%!
    // 답글의 depth 와 image를 추가하는 함수 
    public String arrow(int depth){
	 String rs = "다음"; String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;"; String ts = "";
	 for(int i = 0; i < depth; i++){
		 ts += nbsp; 
	 }  return depth==0?"":ts + rs; }
 
 %>   
      <%
      String id = null;   if(session.getAttribute("login_Id") != null){ id = (String)session.getAttribute("login_Id"); }
String text = request.getParameter("text")==null?"":request.getParameter("text");
int pageNumber = (Integer)request.getAttribute("pageNumbers"); 
int allPage =(Integer)request.getAttribute("allPage"); int endPage =(Integer)request.getAttribute("endPage");
suggestDao dao = suggestDao.getInstance(); List<suggestDto> list = (List<suggestDto>)request.getAttribute("suggestList");
            
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
    
<!--------- 건의사항 시작 ------------>
<!-- 건의사항 리스트 시작 -->
<div id="suggestStart" align="center">
<table border="1" id="suggest2">
<col width="40"><col width="400"><col width="100"><col width="150"><col width="100">
<tr align="center" class="suggestAjax" bgcolor="pink">
<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>조회수</td>
</tr>
<tbody id="suggest">

<%
if(list.size() == 0){
	%>
<tr><td colspan="5"><b>작성된 글이 없습니다</b></td></tr>
<% 
}else{
	for(int i = 0; i < list.size(); i++){
		suggestDto bbs = list.get(i);
%>
     <tr align="center">
    <th><%=bbs.getSeq() %></th>
		<td>
			<%
			if(bbs.getDel() == 0 && bbs.getStep()== 0){
				%>		
				<a href="suggest?work=suggest&detailwork=suggest_detail&seq=<%=bbs.getSeq() %>"><%=bbs.getTitle() %></a>	
	<%}else if(bbs.getStep() > 0 && bbs.getDel()== 0){%>
			
			<a href="suggest?work=suggest&detailwork=suggest_detail&seq=<%=bbs.getSeq() %>"><%=bbs.getTitle() %>&nbsp;[<%=bbs.getStep() %>]</a>	
		<%}
		else{%>		
	<font color="#CC0000">관리자에 의해서 삭제되었습니다</font> 
<%}%>
		</td>  
		<td align="center"><%=bbs.getId() %></td>
		<td><%=bbs.getWdate() %></td>
		<td><%=bbs.getReadcount() %></td>
	</tr>
	<%}}%>
	</tbody>
</table>
</div>
<!-- 건의사항 리스트 끝 -->

<!-- 페이징 번호 시작 -->
<br>
<div align="center" id="">
 <%
 if( allPage == 1 ){
%>
<span id="paging">[<%=1 %>]</span>
<% }else{
       
     for( int i = pageNumber; i < endPage; i++ ){ 
%>
    <a onclick="paging(<%=i%>)">[<%=i+1 %>]</a> 
<%}
}
 %>
 <!-- 페이징 번호 끝 -->
 
 <!-- 글쓰기로 이동버튼 -->
<a href="suggest?work=suggest&detailwork=writeIdcheck">글쓰기</a>
</div>

<!---------- 검색 시작 -------->
<br>
<form action="./suggest" method="get">

<!-- 컨트롤러로 보내는 값 -->
<input type="hidden" value="suggest" name="work"><input type="hidden" value="suggest_main" name="detailwork">
<div align="center">

<!----------------- 검색 시작 ------------>
<!-- 검색 옵션 -->
<select name="option" id="option">
<option value="all" class="all" >전체</option>
<option value="title" class="title">제목</option>
<option value="id" class="id">작성자</option>
<option value="content" class="content">내용</option>
</select>

<!-- 검색입력&검색 버튼 -->
<input type="text" name="text" placeholder="검색" value="<%=text%>" id="text">&nbsp;
<button type="submit" id="search_btn" >검색</button>
</div>
</form>
<!--------- 검색 끝 -------->

<!------------ 건의사항 메인(리스트) 끝 ------------>

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
  <!-- Ajax -->   
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
  <!-- Google Map -->


<!-- 페이징 처리 -->
<script>
function paging( pageno ) {
	  $("#suggest").empty();
	  let option = $("#option").val();
	  let text = $("#text").val();
	$.ajax({
		url:"suggest?work=suggest&pageNumber=" + pageno +"&detailwork=paging&option="+option+"&text="+text,
		type:"get",
		datatype:"json",
		success:(function(datas){
		//alert(datas.map.suggestList);
			let suggestList = datas.map.suggestList;
			let bbspage = datas.map.bbsPage;
			let pagenumber = datas.map.pageNumber;
			$.each(suggestList, function (i, val) {
				 arrow = function( depth ) {
					 let rs = "<img src='./image/arrow.png' width='20px' height='20px'/> ";
					 let nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
					 let ts = "";
					 for( i = 0; i < depth; i++){
						 ts += nbsp; 
					 }return depth==0?"":ts + rs; } 
				let app ="<tr align='center'>"   
				          +"<th>"+ val.seq +"</th>";
				 if(val.del == 0){
					app	+=  "<td>" 
						   + arrow(val.depth)		
						   +"<a href='suggest?work=suggest&detailwork=suggest_detail&seq="+ val.seq + "'>"
						   + val.title
						   + "</a>"
						   +"</td>"
				}else if(val.step > 0 && val.del == 0){
					app	+=  "<td>" 
						   + arrow(val.depth)		
						   +"<a href='suggest?work=suggest&detailwork=suggest_detail&seq="+ val.seq + "'>"
						   + val.title + "&nbsp;" + "[" + val.step + "]"
						   + "</a>"
						   +"</td>"
				}
				 
				 else{
				app +=	"<td>"
					+ "<font color='#CC0000'>관리자에 의해서 삭제되었습니다</font>";
			     	+"</td>";		
				       }
				app	+=  "<td align='center'>"+ val.id +"</td>"
				         +"<td>"+ val.wdate +"</td>"
				         +"<td>"+ val.readcount +"</td>"
					    + "</tr>";
					  	   
				$("#suggest").append(app);		
			}); 	
      })
   });

}
</script>

<!-- 페이징 처리 끝 -->

</body>
</html>




























