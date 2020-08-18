<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
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

  <title>Main Page</title>


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

<body>
<!-- 바디 셋팅 -->
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
                      </h1>
                      <a href="#">
                        <span>
                          	상세보기
                        </span>
                        <img src="img/white-arrow.png" alt="">
                      </a>
                    </div>
                  </div>
                  <div class="col-md-4 ml-auto">
                    <div class="img-box">
                      <img src="img/pants/sk1.jpg" alt="">
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
                         	Shoes<br>Best Product<br> 
                        <!-- <span>
                          Yummy
                        </span> -->
                      </h1>
                      <a href="#">
                        <span>
                         	상세보기
                        </span>
                        <img src="img/white-arrow.png" alt="">
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
                        	Acc<br>Best Product<br> 
                      </h1>
                      <a href="#">
                        <span>
                          	상세보기
                        </span>
                        <img src="img/white-arrow.png" alt="">
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
      <div class="container">
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
                <img src="img/color-arrow.png" alt="">
              </a>
            </div>
          </div>
          <div class="col-md-6">
            <div class="img-box">
              <img src="img/font.jpg" alt="">
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
          <h2>
            Weekly Best Item<!-- (조회순) -->
          </h2>
        </div>
      </div>
      <div class="container">
        <div class="chocolate_container">
          <div class="box">
            <div class="img-box">
              <img src="img/acc/acc1.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
               1 <span>2</span>
              </h6>
              <h5>
                140,000원
              </h5>
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/pants/sk1.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
                1 <span>2</span>
              </h6>
              <h5>
                97,000원
              </h5>
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/shoes/sh3.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
                	1<span>2</span>
              </h6>
              <h5>
                112,000원
              </h5>
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/top/top1.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
               1<span>2</span>
              </h6>
              <h5>
                138,000원
              </h5>
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/pants/sk2.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
                1<span>2 </span>
              </h6>
              <h5>
                49,000원
              </h5>
            </div>
          </div>
          
        </div>
      </div>
    </section>
    <!-- Best 끝 -->
    
    
    
    
    
<!-- 신제품 Best -->
<!-- <section class="chocolate_section ">
      <div class="container">
        <div class="heading_container">
          <h2>
            	New Item
          </h2>
        </div>
      </div>
      <div class="container">
        <div class="chocolate_container">
          <div class="box">
            <div class="img-box">
              <img src="img/top1.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
               1 <span>2</span>
              </h6>
              <h5>
                140,000원
              </h5>
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/sk2.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
                1 <span>2</span>
              </h6>
              <h5>
                97,000원
              </h5>
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
                112,000원
              </h5>
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
                138,000원
              </h5>
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/acc3.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
                1<span>2 </span>
              </h6>
              <h5>
                49,000원
              </h5>
            </div>
          </div>
          
        </div>
      </div>
</section> -->
<!-- 신제품 Best 끝 -->

<hr>
 

	<!-- 카테고리별 제품 나눔 -->
	<section class="category_section">
		<div class="container">
		          <div class="row some-cards">
		          
			           <div class="container">
			       			<div class="heading_container">
			          			<h2>
				           			New Item<!-- (신상품) -->
			          			</h2>
			        		</div> 
			      		</div>
			      		
<!-- 제품 시작 -->
			             <div class="box">
			                <a href="">
		           				<div class="img-box">
			                       	<img src="img/shoes/sh1.jpg" alt="">
			                    </div>
			                 </a>
			                 <b>PUMA UltraRide</b><p style="color: gray; text-decoration: line-through;">60,000원<p style="color: red;">55,000원</p>
			             </div>
		               
			             <div class="box">
			                <a href="">
		           				<div class="img-box">
			                       	<img src="img/acc/acc2.jpg" alt="">
			                    </div> 
			                 </a>
			                 <b>손톱보호대ㅋ</b><p style="color: gray; text-decoration: line-through;">60,000원<p style="color: red;">55,000원</p>
			             </div>
		                    
			             <div class="box">
			                <a href="">
		           				<div class="img-box">
			                       	<img src="img/acc/acc3.jpg" alt="">
			                    </div>
			                 </a>
			                 230,000원<br>오렌지리프 블라우스
			             </div>
			                
				         <div class="box">
			                <a href="">
		           				<div class="img-box">
			                       	<img src="img/shoes/sh1.jpg" alt="">
			                    </div>
			                 </a>
			                 60,000원<br>PUMA<br>굽 5cm
			             </div>
			             
			             
						 <div class="box">
			                <a href="">
		           				<div class="img-box">
			                       	<img src="img/pants/sk2.jpg" alt="">
			                    </div>
			                 </a>
			                 60,000원<br>PUMA<br>굽 5cm
			             </div>
		               
			             <div class="box">
			                <a href="">
		           				<div class="img-box">
			                       	<img src="img/pants/sk1.jpg" alt="">
			                    </div>
			                 </a>
			                 60,000원<br>PUMA<br>굽 5cm
			             </div>
		                    
			             <div class="box">
			                <a href="">
		           				<div class="img-box">
			                       	<img src="img/top/top1.jpg" alt="">
			                    </div>
			                 </a>
			                 230,000원<br>오렌지리프 블라우스
			             </div>
			                
				         <div class="box">
			                <a href="">
		           				<div class="img-box">
			                       	<img src="img/shoes/sh3.jpg" alt="">
			                    </div>
			                 </a>
			                 60,000원<br>PUMA<br>굽 5cm
			             </div>		                 
		                 
		                 
		                 
		        	</div>
			</div> 
	</section>
	
	<!-- 카테고리별 끝 -->

	
	
	
	
<!-- test -->
<!-- <section class="new_section padding-set">
		          <div class="row some-cards">
			           <div class="new_container">
			       			<div class="heading_container">
			          			<h2>
				           			New Item(신상품)
			          			</h2>
			        		</div>
			      		</div>
			      		
			             <div class="new_box">
			                <a href="">
		           				<div class="img-box">
			                       	<img src="img/sk2.jpg" alt="">
			                    </div>
			                 </a>
			                 <p>50,000원<p><h6>디자이너 체크 면바지</h6>
			             </div>
		               
			             <div class="new_box">
			                <a href="">
		           				<div class="img-box">
			                       	<img src="img/sk1.jpg" alt="">
			                    </div>
			                 </a>
			                 <div class="detail-box">
			                 230,000원<br>플리츠 스커트
			                 </div>
			             </div>
		                    
			             <div class="new_box">
			                <a href="">
		           				<div class="img-box">
			                       	<img src="img/top1.jpg" alt="">
			                    </div>
			                 </a>
			                 230,000원<br>오렌지리프 블라우스
			             </div>
			                
				         <div class="new_box">
			                <a href="">
		           				<div class="img-box">
			                       	<img src="img/sh3.jpg" alt="">
			                    </div>
			                 </a>
			                 60,000원<br>PUMA<br>인기상품
			             </div>
			          </div>
</section>
 -->






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
              	서울특별시 강남구 테헤란로<br> 5길 11 YOO빌딩 2층
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
              	Q & A<br>
              	공지사항
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
  
<!-- 바디 끝 -->
</body>
</html>
