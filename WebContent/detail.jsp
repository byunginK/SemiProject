<%@page import="java.util.HashMap"%>
<%@page import="dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>

<%
HashMap map = (HashMap)request.getAttribute("map");
List<ProductDto> list2 = (List<ProductDto>)map.get("listtop");
List<ProductDto> list3 = (List<ProductDto>)map.get("listbottom");
List<ProductDto> list4 = (List<ProductDto>)map.get("listshoes");
List<ProductDto> list5 = (List<ProductDto>)map.get("listac");
ProductDto dto = new ProductDto();

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
<body class="sub_page">
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
                 <a class="nav-link" href="addPro?work=list">카테고리</a>
                </li>
                 <li class="nav-item">
                  <a class="nav-link" href="addPro?work=add">제품 추가(임시)</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="CScenter.jsp">고객센터</a>
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





    <!-- Best Product 5개 -->
    <section class="chocolate_section ">
      <div class="container">
        <div class="heading_container">
          <h2><br><br>
            Weekly Best Item(판매량순)
          </h2>
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
                140,000원
              </h5>
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
                97,000원
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
                112,000원
              </h5>
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
                138,000원
              </h5>
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="img/sk2.jpg" alt="">
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
            
            
            
            
            
              
<!-- 카테고리별 디테일 -->
     
<!-- 상의 -->
	<section class="category_section">
		<div class="container">
		          <div class="row some-cards">
		          
		             <div class="container">
		       			<div class="heading_container">
		          			<h2>
			           			Top & Outer
		          			</h2>
		        		</div>
		      		 </div>
			      		
			      	<%
			      	
			      	for(int i = 0; i < list2.size(); i++){
			      		dto = list2.get(i);
			      		%>
			      	 <div class="box">
		                <a href="productDetail?work=product&seq=<%=dto.getSeq()%>">
	           				<div class="img-box">
		                       	<img src="productimg/<%=dto.getFilename() %>" alt="">
		                    </div>
		                 </a>
		                 	<%=dto.getP_price() %>원<br><%=dto.getP_name() %><br><%=dto.getP_info() %>
		             </div>
			      		<%
			      	}
			      	%>	
		            
		             
	        	</div>
			</div> 
	</section>
<!-- 상의 끝 -->
	
	
	
	
<!-- 하의 -->
	<section class="category_section">
		<div class="container">
		          <div class="row some-cards">
		          
		             <div class="container">
		       			<div class="heading_container">
		          			<h2>
			           			Pants & Skirts
		          			</h2>
		        		</div>
		      		 </div>
			      		
		            <%
			      	
			      	for(int i = 0; i < list3.size(); i++){
			      		dto = list3.get(i);
			      		%>
			      	 <div class="box">
		                <a href="productDetail?work=product&seq=<%=dto.getSeq()%>">
	           				<div class="img-box">
		                       	<img src="productimg/<%=dto.getFilename() %>" alt="">
		                    </div>
		                 </a>
		                 	<%=dto.getP_price() %>원<br><%=dto.getP_name() %><br><%=dto.getP_info() %>
		             </div>
			      		<%
			      	}
			      	%>	
		               
		             
	        	</div>
			</div> 
	</section>
<!-- 하의 끝 -->	
	
	
	
	
	
<!-- 신발 -->
	<section class="category_section">
		<div class="container">
		          <div class="row some-cards">
		          
		             <div class="container">
		       			<div class="heading_container">
		          			<h2>
			           			Shoes
		          			</h2>
		        		</div>
		      		 </div>
			      		
			      		
		           <%
			      	
			      	for(int i = 0; i < list4.size(); i++){
			      		dto = list4.get(i);
			      		%>
			      	 <div class="box">
		                <a href="productDetail?work=product&seq=<%=dto.getSeq()%>">
	           				<div class="img-box">
		                       	<img src="productimg/<%=dto.getFilename() %>" alt="">
		                    </div>
		                 </a>
		                 	<%=dto.getP_price() %>원<br><%=dto.getP_name() %><br><%=dto.getP_info() %>
		             </div>
			      		<%
			      	}
			      	%>	
		             
		             
	        	</div>
			</div> 
	</section>
<!-- 신발 끝 -->	
	
	
	
	
	
	


<!-- 악세서리 -->
	<section class="category_section">
		<div class="container">
		          <div class="row some-cards">
		          
		             <div class="container">
		       			<div class="heading_container">
		          			<h2>
			           			Pants & Skirts
		          			</h2>
		        		</div>
		      		 </div>
			      		
			      		
		            <%
			      	
			      	for(int i = 0; i < list5.size(); i++){
			      		dto = list5.get(i);
			      		%>
			      	 <div class="box">
		                <a href="productDetail?work=product&seq=<%=dto.getSeq()%>">
	           				<div class="img-box">
		                       	<img src="productimg/<%=dto.getFilename() %>" alt="">
		                    </div>
		                 </a>
		                 	<%=dto.getP_price() %>원<br><%=dto.getP_name() %><br><%=dto.getP_info() %>
		             </div>
			      		<%
			      	}
			      	%>	
		             
		             
		             
	        	</div>
			</div> 
	</section>
<!-- 악세서리 끝 -->


	
	
	
	
    
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

</body>
</html>
