<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("utf-8"); %>    
   <%
      String id = null;
       if(session.getAttribute("login_Id") != null){
    	   id = (String)session.getAttribute("login_Id");
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

  <title>Simple Five</title>


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
<body>

<!-- 바디 셋팅 -->
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
                <li class="nav-item">
                  <a class="nav-link" href="#" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'; return false;">고객센터</a>
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
      
      <!-- 메인 슬라이드 -->
      <section class="slider_section ">
        <div id="customCarousel1" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="container">
                <div class="row">
                  <div class="col-md-6">
                    <div class="detail_box">
                      <h1>
                         Simple Five <br>Best Product<br> 
                       <!--  <span>
                          Yummy
                        </span> -->
                      </h1>
                      <a href="#">
                        <span>
                          	상세보기
                        </span>
                        <img src="images/white-arrow.png" alt="">
                      </a>
                    </div>
                  </div>
                  <div class="col-md-4 ml-auto">
                    <div class="img-box">
                      <img src="img/sk1.jpg" alt="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="container">
                <div class="row">
                  <div class="col-md-6">
                    <div class="detail_box">
                      <h1>
                      
                         	Shoes <br>Best Product<br> 
                        <!-- <span>
                          Yummy
                        </span> -->
                      </h1>
                      <a href="#">
                        <span>
                         	상세보기
                        </span>
                        <img src="images/white-arrow.png" alt="">
                      </a>
                    </div>
                  </div>
                  <div class="col-md-4 ml-auto">
                    <div class="img-box">
                      <img src="img/mg2.jpg" alt="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item ">
              <div class="container">
                <div class="row">
                  <div class="col-md-6">
                    <div class="detail_box">
                      <h1>
                        	Acc <br>Best Product<br> 
                       <!--  <span>
                          Simple Five
                        </span> -->
                      </h1>
                      <a href="#">
                        <span>
                          	상세보기
                        </span>
                        <img src="images/white-arrow.png" alt="">
                      </a>
                    </div>
                  </div>
                  <div class="col-md-4 ml-auto">
                    <div class="img-box">
                      <img src="img/mg3.jpg" alt="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel_btn-box">
          <a class="carousel-control-prev" href="#customCarousel1" role="button" data-slide="prev">
            <i class="fa fa-arrow-left" aria-hidden="true"></i>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#customCarousel1" role="button" data-slide="next">
            <i class="fa fa-arrow-right" aria-hidden="true"></i>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </section>
    	  <!-- 슬라이드 끝 -->
    
    </div>
	<!-- hero_area 끝 -->
	
	
    <!-- 메인창 중간 회사소개 -->
    <section class="about_section layout_padding ">
      <div class="container  ">
        <div class="row">
          <div class="col-md-6"> 
            <div class="detail-box">
              <div class="heading_container">
                <h2>
                  	"Simple Five"
                </h2>
              </div>
              <p>
               <br>
                	Simple Five는 단순한 심플함이 아닌, 에너제틱한 일상생활속 편하고 간편하게 입을 수 있는 의상을 추구합니다</p>
              <a href="#">
                <span>
                 	고객센터
                </span>
                <img src="images/color-arrow.png" alt="">
              </a>
            </div>
          </div>
          <div class="col-md-6">
            <div class="img-box">
              <img src="img/bg5.jpg" alt="">
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 회사소개 끝 -->


    <!-- Best Product 5개 -->
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
              <img src="img/acc1.jpg" alt="">
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

    <!-- Best 끝 -->
    
    
    <!-- 신제품 Best -->
    <section class="chocolate_section ">
      <div class="container">
        <div class="heading_container">
          <h2><br><br>
           	신제품 Best
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
              <img src="img/acc2.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
                1 <span>2</span>
              </h6>
              <h5>
                110,000ì
              </h5>
<!--          <a href="">
              	êµ¬ë§¤íê¸°
              </a> -->
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/sk2.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
               1<span>2</span>
              </h6>
              <h5>
                57,000ì
              </h5>
<!--          <a href="">
                	ì í ë³´ê¸°
              </a> -->
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/sh1.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
                	1<span>2</span>
              </h6>
              <h5>
                112,000ì
              </h5>
<!--               <a href="">
              	  ìì¸ë³´ê¸°
              </a> -->
            </div>
          </div>
     
        </div>
      </div>
            <div class="container">
        <div class="chocolate_container">
          <div class="box">
            <div class="img-box">
              <img src="img/acc3.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
                1<span>2</span>
              </h6>
              <h5>
                90,000ì
              </h5>
<!--          <a href="">
              	êµ¬ë§¤íê¸°
              </a> -->
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/sk3.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
               1<span>2</span>
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
                1<span>2</span>
              </h6>
              <h5>
                92,000원
              </h5>
<!--               <a href="">
              	  ìì¸ë³´ê¸°
              </a> -->
            </div>
          </div>
     
        </div>
      </div>
    </section>
    
	<!-- 신제품 Best 끝 -->



    <!-- 디테일 -->
    
    <section class="contact_section layout_padding">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-5 col-lg-4 offset-md-1 offset-lg-2">
            <div class="form_container">
              
              
              
              
              
              
              
            </div>
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