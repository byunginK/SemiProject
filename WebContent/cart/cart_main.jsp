<%@page import="dto.cartDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
	
	List<cartDto> list = (List<cartDto>) request.getAttribute("list");
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
 
<title>장바구니</title>
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
.itext{
	/* border: 0.2px solid grey; */
	border:none;
	box-shadow: 0px 0px 2px 0px grey;
}
.table-header {
    background-color: #95A5A6;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.03em;
    text-align:center;
}
.btn {        
    font-size: 16px;
    font-weight: bold;
	background: gray;
	border: none;
    color: white;
    border-radius: 2px;
}
#thtitle{
	height:50px;
}
.listtr{
	height:10px;
	background-color: #ffffff;
    box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.3);
    text-align:center;
}
#totid{
	font-weight: 950;
}
.imggrp{
	width:80px;
	height:80px;
	padding-top:5px;
	padding-bottom: 5px;
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


<!-- 리스트 뽑는 부분 -->
<div id="listcontainer">
<table id="tb">
<col width="50"><col width="250"><col width="250">
<col width="50"><col width="80"><col width="50"><col width="120">
<tr id="thtitle">
<th class="table-header"><input type="checkbox" id="allchk" class="itext"></th>
<th class="table-header">이미지</th>
<th class="table-header">상품정보</th>
<th class="table-header"></th>
<th class="table-header">수량</th>
<th class="table-header"></th>
<th class="table-header">가격</th>
</tr>
<% if(list.size()==0){ %>
<tr class='listtr'>
<td colspan="7">장바구니가 비어있습니다</td>
</tr>
<% }else{ 
	for(int i=0; i<list.size(); i++){
		cartDto dto = list.get(i);	
%>
<tr class='listtr'>
<td>
<input type="checkbox" name="delchk" class="itext" id="chk<%=dto.getSeq() %>"
onclick="chkbox(<%=dto.getSeq() %>)" value="<%=dto.getSeq()%>">
</td>
<td id="itemimg"><img alt="이미지 없음" src="./productimg/<%=dto.getFilename() %>" class="imggrp"></td>
<td id="name">
<dl>
<dt><%=dto.getItem_name() %></dt>
<dd>색상 : <%=(dto.getColor()==null)?"랜덤":dto.getColor() %></dd>
<dd>사이즈 : <%=(dto.getSize()==null)?"랜덤":dto.getSize() %></dd>
</dl>
</td>
<td><input type="button" class="btn" onclick="minqty(<%=dto.getSeq()%>)" value="-"></td>
<td id="qty<%=dto.getSeq()%>"><%=dto.getQty() %></td>
<td><input type="button" class="btn" onclick="pluqty(<%=dto.getSeq()%>)" value="+"></td>
<td id="price<%=dto.getSeq()%>"><%=dto.getQty()*dto.getItem_price() %></td>
</tr>
<%}} %>
</table>

</div>

<!-- 결제 넘기기 -->
<div id="paycontainer">

<h2 id="totid">총 합계 &nbsp;&nbsp;&nbsp;&nbsp;
<span id="tot" style="text-align:right;"></span>
</h2>
</div>

<div id="btncontainer" align="left">
<input type="button" class="btn" onclick="delbtn()" value="선택 상품 삭제">
<input type="button" class="btn" onclick="payfun()" value="결제하기">
<input type="button" value="돌아가기" onClick="history.go(-1)" class="btn"> 
</div>

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
let tot = 0;
$("#allchk").change(function() {
	let a = $("#allchk").is(":checked");
	//console.log(a);

	$("input:checkbox[name=delchk]").each(function() {
		let pid ="#price"+this.value
		let price = $(pid).html();
		//console.log(this.checked+","+this.value);
		if(this.checked){
			//console.log(this.value);
			if(!a){ //현재 선택인데 전체선택 해제일 경우
				tot = parseInt(tot)-parseInt(price);
			}
			/*
			else{ // 현재 true인데 전체선택 일 경우
				
			}*/
			//전체 선택했느데 true라면 또 더해줄 필요 없음
			
		}else{
			if(a){ //현재 노 체크 인데, 전체선택이 될 경우
				tot = parseInt(tot)+parseInt(price);
			}/*
			else{ // 현재 false인데, 전체선택 해제 될 경우
			}*/
				//tot = parseInt(tot)-parseInt(price);
		}
			$("#tot").html(tot);
	});
	
	if(a){
		$("input[name=delchk]").prop("checked",true);
	}else{
		$("input[name=delchk]").prop("checked",false);
	}
	
});

function chkbox(data) {
	//console.log(data);
	let cid = "#chk"+data;
	let ischk = $(cid).prop("checked");
	//console.log("ischk = "+ischk);
	let pid = "#price"+data;
	let price = $(pid).html();
	//console.log(price);
	
	if(ischk){
		tot = parseInt(tot)+parseInt(price);
	}else{
		tot = parseInt(tot)-parseInt(price);
	}
	$("#tot").html(tot);
}

function minqty(data) {
	//console.log(data);
	let qtseq = "#qty"+data;
	let prseq = "#price"+data;
	let price = parseInt($(prseq).html());
	let num = $(qtseq).html();
	let itemprice = parseInt(price)/parseInt(num);
	if(num>1){
		num= parseInt(num)-1;
		price = price-itemprice;
	
	 	$.ajax({
			url:"./cartcont",
			type:"get", 
			datatype:"text",
			data:"work=chgqty&seq="+data+"&qty="+num, 
			success:function(obj){
				if(!obj.b){
					alert("정상적으로 수량이 수정되지 않았습니다");
				}else{
					$(qtseq).html(num);
					$(prseq).html(price);
				}
			},
			error:function(){
				alert("error");
			}
		});
	}
	
}
function pluqty(data) {
	//console.log(data);
	let qtseq = "#qty"+data;
	let num = $(qtseq).html();
	let prseq = "#price"+data;
	let price = parseInt($(prseq).html());
	let itemprice = parseInt(price)/parseInt(num);
	num = parseInt(num) +1;
	price = parseInt(price)+itemprice;
	//console.log(data+" , "+num);
	$.ajax({
		url:"./cartcont",
		type:"get", 
		datatype:"text",
		data:"work=chgqty&seq="+data+"&qty="+num, 
		success:function(obj){
			if(!obj.b){
				alert("정상적으로 수량이 수정되지 않았습니다");
			}else{
				$(qtseq).html(num);
				$(prseq).html(price);
			}
		},
		error:function(){
			alert("error");
		}
	});
	
}
function delbtn() {
	let dseq = "";
	$("input:checkbox[name=delchk]").each(function() {
		if(this.checked){
		//console.log(this.value);
			if(dseq==""){
				dseq= dseq+ this.value;
			}else{
				dseq = dseq+","+this.value;
			}
		}
	});
	//console.log("dseq = "+dseq);
	$.ajax({
		url:"./cartcont",
		type:"get", 
		datatype:"text",
		data:"work=delitem&seq="+dseq, 
		success:function(obj){
			if(!obj.b){
				alert("정상적으로 선택 상품이 삭제되지 않았습니다");
			}else{
				alert("정상적으로 삭제 되었습니다");
				location.href="./cartcont?work=cmove&id=<%=mem.getId()%>";
			}
		},
		error:function(){
			alert("error");
		}
	});
}

function payfun() {
	let dseq = "";
	$("input:checkbox[name=delchk]").each(function() {
		if(this.checked){
		//console.log(this.value);
			if(dseq==""){
				dseq= dseq+ this.value;
			}else{
				dseq = dseq+","+this.value;
			}
		}
	});
	//결제하기 링크 추가
	console.log(dseq);
	location.href = "purchaseCon?work=buylist&item_seq="+dseq;
}
</script>

</body>
</html>