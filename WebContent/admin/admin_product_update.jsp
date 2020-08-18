<%@page import="dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ProductDto> list = (List<ProductDto>) request.getAttribute("list");
	int len = (int) request.getAttribute("len");
	MemberDto mem = (MemberDto) session.getAttribute("login_Dto");
	//MemberDto mem = new MemberDto("a",1); 
	
	if(mem==null){
%>
	<script type="text/javascript">
		alert("로그인 해주십시오");
		//로그인 페이지로 이동
	</script>
<%		
	}
%>
<%
	int pageNumber = 0;
	String spageNumber = (request.getParameter("pageNumber")==null)?"0":request.getParameter("pageNumber");
	if(!spageNumber.equals("0")) pageNumber = Integer.parseInt(spageNumber);
	
	String need = (request.getParameter("need")==null)?"":request.getParameter("need");
	String fneed = (request.getParameter("fneed")==null)?"":request.getParameter("fneed");
	
	int tpage = len / 10;	//page 총 갯수
	if(len%10 >0 ) tpage++;
	
	int blockCount = (tpage%5==0)?(tpage / 5)-1:(tpage / 5); // block의 총 갯수
	int thisBlock = pageNumber / 5; // block 현재 위치
	
	int startBlock = thisBlock*5;
	int endBlock = thisBlock*5+5;
	
	//System.out.println("list = "+list.size()+", len ="+len);
	//System.out.println("엥? "+ pageNumber + "len ="+len+" tpage ="+tpage+" blockCount =" + blockCount);
	//System.out.println("엥? "+thisBlock+ " start = "+startBlock +" end = "+endBlock);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />

<title>제품 수정</title>
<script type="text/javascript" src ="<%=request.getContextPath() %>/jquery/jquery-3.5.1.min.js"></script>
<style type="text/css">
table{
	border-collapse: collapse; 
	/* max-width: 100%; */
}
h2{
	background-color: #f0f0f0;
	text-align: center !import;
}
ul{
	list-style:none;
}
li{
	float:left;
	margin-left:10px;
}
a{
	text-decoration:none;
}
.btn {        
    font-size: 16px;
    font-weight: bold;
	background: gray;
	border: none;
    color: white;
    border-radius: 2px;
}
.table-header {
    background-color: #95A5A6;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.03em;
}
.listtr{
	height:50px;
	background-color: #ffffff;
    box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.3);
}
#deltbcontainer{
	margin-left:50px;
}
#pagecontainer{
	margin-left:100px;
	margin-top:20px;
	margin-bottom:20px;
}
#scontainer{
	margin-left:100px;
}
#thtitle{
	height:50px;
}
.itext{
	/* border: 0.2px solid grey; */
	border:none;
	box-shadow: 0px 0px 2px 0px grey;
}
#forimg{
	padding-left:100px;
	margin-left:100px;
}
</style>
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
    
<section class="contact_section layout_padding">
<div class="container-padding">

<!-- 삭제 버튼 부분 -->
<div id="delcontainer">
<input type="button" value="돌아가기" onclick="backBtn()" class="btn">
</div>
<br>

<!--리스트 테이블 부분  -->
<div id="deltbcontainer">

<table id="bigtb" >
<col width="800"><col width="300">
<tr>

<!--게시판 테이블  -->
<td>

<table id="tblist" >
<col width="400"><col width="150"><col width="200">
<tr id="thtitle">
<th class="table-header">이름</th>
<th class="table-header">분류</th>
<th class="table-header">파일명</th>
</tr>
<% if(list.size()==0 || list == null){%>
	<tr class='listtr'><td colspan="3">작성된 글이 없습니다</td></tr>
<%
	}else{
	for(int i=0; i<list.size(); i++){ 

	ProductDto dto = list.get(i); %>
	<tr class='listtr'>
		<td onclick="umove(<%=dto.getSeq()%>)"><%=dto.getP_name() %></td>
		<td><%=dto.getP_category() %></td>
		<td onclick="showimg('<%=dto.getFilename()%>')"><%=dto.getFilename() %></td>
	</tr>
<% } } %>
</table>

</td>

<!-- 이미지 보여지는 부분 -->
<td id="forimg">
파일명을 클릭하면 <br>
사진을 볼 수 있습니다
</td>
</tr>

</table>
</div>

<!-- pageNumber  -->
<div id="pagecontainer">
<ul id="pagelist">
<li><a href="#none" onclick="fPage()"> << </a></li>
<% if(thisBlock > 0){ %>
		<li><a href="#none" onclick="prevpage(<%=thisBlock %>)"> < </a></li>
<% }
   if(endBlock > tpage){
	   endBlock = tpage;
   }
	for(int i=startBlock; i<endBlock; i++){ 
	if(pageNumber == i){
%>
	<li><span style="font-weight:bold; font-size:12pt;"><%=i+1 %></span></li>
	<%}else{ %>
	<li><a href="#none" onclick="goPage(<%=i %>)"><%=i+1 %></a></li>
<%	}
	} // for문 종료
	if(endBlock < tpage){%>
	<li><a href="#none" onclick="nextpage(<%=thisBlock %>)"> > </a></li>
<%	}%>
	<li><a href="#none" onclick="lpage(<%=len %>)"> >> </a></li>
</ul>
</div>

<br><br>

<!-- 검색 부분 -->
<div id="scontainer" >
<select id="need">
	<option value="P_NAME" selected>제목</option>
	<option value="P_CATEGORY">분류</option>
</select>
<input type="text" size="15" id="fneed">
<input type="button" id="schbtn" value="검색" class="btn">
</div>
<% if(!need.equals("")){%>
	<script type="text/javascript">
		$("#need").val('<%=need%>').prop("selected","selcted");
	</script>
<% }
   if(!fneed.equals("")){
%>
	<script type="text/javascript">
		$("#fneed").val("<%=fneed%>");
	</script>
<% } %>

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
                <a href="contact.jsp">
                  	고객센터
                </a>
                <a href="login.jsp">
                  	로그인
                </a>
                <a href="register.jsp">
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
let pageNumber = 0;

$("#schbtn").click(function() {
	let need = $("#need option:selected").val();
	let fneed = $("#fneed").val();
	
	//console.log(need +" "+fneed);
	//console.log($(".listtr").length);
	
	location.href="./admincont?work=proup_qsearch&need="+need+"&fneed="+fneed+"&pageNumber=0";
	
});

function goPage(data) {
	//console.log(data);
	if('<%=need%>'==""){
		location.href="./admincont?work=proup_moveQnadel&pageNumber="+data;
	}else{
		location.href="./admincont?work=proup_qsearch&need=<%=need%>&fneed=<%=fneed%>&pageNumber="+data;
	}
}
function fPage(){
	location.href="./admincont?work=proup_moveQnadel&pageNumber="+0;
}
function lpage(){
	//console.log(<%=tpage%>);
	location.href="./admincont?work=proup_moveQnadel&pageNumber=<%=tpage-1%>";
}
function prevpage(data) {
	location.href="./admincont?work=proup_moveQnadel&pageNumber="+((data*5)-5);
}
function nextpage(data) {
	location.href="./admincont?work=proup_moveQnadel&pageNumber="+((data*5)+5);
}

function backBtn() {
	location.href="<%=request.getContextPath() %>/admin/admin_main.jsp";
}
function showimg(data) {
	let s = "productimg/"+data;
	//console.log(s);
	let str = '<img alt="이미지 없음" src="'+s+'" width="300px" height="300px">';
	
	$("#forimg").html(str);
	//$("#forimg").append("data");
}
function umove(data) {
	//console.log(data);
	location.href="./admincont?work=updemove&seq="+data;
}
</script>

</body>
</html>