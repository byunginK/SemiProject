<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>

<% //임시 로그인 정보
String id = null;
if(session.getAttribute("login_Id") != null){
	   id = (String)session.getAttribute("login_Id");
}

Map map = (HashMap)request.getAttribute("map");
String ln = (String)map.get("listNum");
int listNum = Integer.parseInt(ln);
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

  <title>Detail</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!--slick slider stylesheet -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />

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

<body class="sub_page">

  <div class="main_body_content">

    <div class="hero_area">
    
     <!-- 헤더 -->
      <header class="header_section">
        <div class="container-fluid">
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
                <li class="nav-item">
                  <a class="nav-link"href="#" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'; return false;">고객센터</a>
                </li>
             
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
              </ul>

            </div>
          </nav>
        </div>
      </header>
      <!-- 헤더 끝 -->
    </div>


    <!-- 금주의 Best 제품-->
   <section class="chocolate_section ">
      <div class="container">
        <div class="heading_container">
          <h2><br><br>
            금주의 Best Product
          </h2>
 <!--          <p>
            ìì¸ì¬ë¦¬
          </p> -->
        </div>
      </div>
      <div class="container">
        <div class="chocolate_container">
          <div class="box">
            <div class="img-box">
            	<%
            	List<ProductDto> list = (List<ProductDto>)map.get("listall");
            	for(int i =0; i < list.size(); i++){
            		ProductDto pro = list.get(i);
            	%>	
            		<a href="productDetail?work=product&seq=<%=pro.getSeq()%>"><img src="productimg/<%=pro.getFilename() %>" alt=""></a>
            	<%	
            	}
            	%>
				
            </div>
            <div class="detail-box">
              <h6>
               1 <span>2</span>
              </h6>
              <h5>
                140,000ì
              </h5>
<!--          <a href="">
              	êµ¬ë§¤íê¸°
              </a> -->
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/sk1.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
                1 <span>2</span>
              </h6>
              <h5>
                97,000ì
              </h5>
<!--          <a href="">
                	ì í ë³´ê¸°
              </a> -->
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/sh3.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
                	1<span>2</span>
              </h6>
              <h5>
                112,000ì
              </h5>
<!--               <a href="">
              	  ìì¸ë³´ê¸°
              </a> -->
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/top1.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
               1<span>2</span>
              </h6>
              <h5>
                138,000ì
              </h5>
<!--               <a href="">
               	ìì¸ë³´ê¸°
              </a> -->
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/sk2.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
                1<span>2 </span>
              </h6>
              <h5>
                49,000ì
              </h5>
<!--               <a href="">
             		ìì¸ë³´ê¸°
              </a> -->
            </div>
          </div>
          
        </div> 
      </div>
    </section>
     <!-- Best제품 끝 -->
    
              
     <!-- 디테일 -->
          
  <section class="contact_section layout_padding">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-5 col-lg-4 offset-md-1 offset-lg-2">
            <div class="form_container" style="width: 1200px;">
             	 <h1>상의</h1>
             	 <br>
             	 <button type="button" onclick="printimg(1)"id="topbtn"><<</button>
             	 <%
             	List<ProductDto> list2 = (List<ProductDto>)map.get("listtop");
            	for(int i =0; i < list2.size(); i++){
            		ProductDto pro = list2.get(i);
            	%>	
            		<a href="productDetail?work=product&seq=<%=pro.getSeq()%>" class="topdis"><img src="productimg/<%=pro.getFilename() %>" alt="" width="200px" height="250px"></a>
            	<%	
            	}
            	%>
            	<button type="button" onclick="printimg(2)">>></button>
            	<br><br>
              	<h1>하의</h1>
              	<br>
              	<button type="button" onclick="printimg(3)"id="botbtn"><<</button>
             	 <%
             	List<ProductDto> list3 = (List<ProductDto>)map.get("listbottom");
            	for(int i =0; i < list3.size(); i++){
            		ProductDto pro = list3.get(i);
            	%>	
            		<a href="productDetail?work=product&seq=<%=pro.getSeq()%>" class="botdis"><img src="productimg/<%=pro.getFilename() %>" alt="" width="200px" height="250px"></a>
            	<%	
            	}
            	%>
            	<button type="button" onclick="printimg(4)">>></button>
            	<br><br>
            	<h1>신발</h1>
            	<br>
            	<button type="button" onclick="printimg(5)"id="shobtn"><<</button>
             	 <%
             	List<ProductDto> list4 = (List<ProductDto>)map.get("listshoes");
            	for(int i =0; i < list4.size(); i++){
            		ProductDto pro = list4.get(i);
            	%>	
            		<a href="productDetail?work=product&seq=<%=pro.getSeq()%>" class="shodis"><img src="productimg/<%=pro.getFilename() %>" alt="" width="200px" height="250px"></a>
            	<%	
            	}
            	%>
            	<button type="button" onclick="printimg(6)">>></button>
            	<br><br>
            	<h1>악세사리</h1>
            	<br>
            	<button type="button" onclick="printimg(7)"id="accbtn"><<</button>
             	 <%
             	List<ProductDto> list5 = (List<ProductDto>)map.get("listac");
            	for(int i =0; i < list5.size(); i++){
            		ProductDto pro = list5.get(i);
            	%>	
            		<a href="productDetail?work=product&seq=<%=pro.getSeq()%>" class="accdis"><img src="productimg/<%=pro.getFilename() %>" alt="" width="200px" height="250px"></a>
            	<%	
            	}
            	%>
            	<button type="button" onclick="printimg(8)">>></button>
              
            </div>
          <div class="col-md-6  px-0">
            <div class="map_container">
              <div class="map">
                <div id="googleMap"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
     <!-- 디테일 끝 -->

   
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
              	Q&A
              </p>
            </div>
          </div>
<!-- 고객센터 -->
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
  <!-- 밑창 끝 -->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- slick slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <script type="text/javascript">
  let listCount = <%=listNum %>;
	  function printimg(num) {
		  if(num==1){
			  let category = "top";
			  let rm = ".topdis";
			  let add = "#topbtn";
			  let cla = "topdis";
			  listCount--;
			  displayAjax(category, rm, cla, add);
			  if(listCount < 1){
				  listCount = 1;
			  }
		  }else if(num == 2){
			  let category = "top";
			  let rm = ".topdis";
			  let add = "#topbtn";
			  let cla = "topdis";
			  listCount++;
			  displayAjax(category, rm, cla, add);
			  if(listCount > <%=list2.size()%>){
				  listCount = 0;
			  }
		  }else if(num == 3){
			  let category = "bottom";
			  let rm = ".botdis"
			  let add = "#botbtn";
			  let cla = "botdis";
			  listCount--;
			  displayAjax(category, rm, cla, add);
			  if(listCount < 1){
				  listCount = 1;
			  }
		  }else if(num == 4){
			  let category = "bottom";
			  let rm = ".botdis"
			  let add = "#botbtn";
			  let cla = "botdis";
			  listCount++;
			  displayAjax(category, rm, cla, add);
			  if(listCount > <%=list3.size()%>){
				  listCount = 0;
			  }
		  }else if(num == 5){
			  let category = "shoes";
			  let rm = ".shodis"
			  let add = "#shobtn";
			  let cla = "shodis";
			  listCount--;
			  displayAjax(category, rm, cla, add);
			  
			  if(listCount < 1){
				  listCount = 1;
			  }
		  }else if(num == 6){
			  let category = "shoes";
			  let rm = ".shodis"
			  let add = "#shobtn";
			  let cla = "shodis";
			  listCount++;
			  displayAjax(category, rm, cla, add);
			 
			  if(listCount > <%=list2.size()%>){
				  listCount = 0;
			  }
		  }else if(num == 7){
			  let category = "accessary";
			  let rm = ".accdis"
			  let add = "#accbtn";
			  let cla = "accdis";
			  listCount--;
			  displayAjax(category, rm, cla, add);
			  if(listCount < 1){
				  listCount = 1;
			  }
		  }else if(num == 8){
			  let category = "accessary";
			  let rm = ".accdis"
			  let add = "#accbtn";
			  let cla = "accdis";
			  listCount++;
			  displayAjax(category, rm, cla, add);
			  if(listCount > <%=list2.size()%>){
				  listCount = 0;
			  }
		  }
		
	}

function displayAjax(category, rm,cla, add) {
	$.ajax({
		url:"addPro",
		type:"get",
		datatype:"json",
		data:"work=display&listNum="+listCount+"&category="+category,
		success:function(data){
		//	alert(listCount);
			let list = data.map.display;
		//	alert(nextlist);
			$("a").remove(rm);
			for(let i =0; i < list.length; i++){
        		
        		addlist="<a href='productDetail?work=product&seq='"+list[i].seq+"' class='"+cla+"'>"
        				+"<img src='productimg/"+list[i].filename+"' width='200px' height='250px'></a>";
        		$(add).eq(-1).after(addlist);
        	}
        	
		},
		error:function(){
			alert("error");
		}
	});
}
  
  </script>

</body>

</html>