<%@page import="dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
ProductDto dto = (ProductDto)request.getAttribute("product");
String color = request.getParameter("color");
String size = request.getParameter("size");
String count = request.getParameter("buy_count");
String totalPrice = request.getParameter("totalprice");


String id = null;
 if(session.getAttribute("login_Id") != null){
	   id = (String)session.getAttribute("login_Id");
 }

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="./productDetail.css" type="text/css">
<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<!--slick slider stylesheet -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />
<!-- font awesome style -->
<link href="css/font-awesome.min.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet" />
<!-- 결제 라이브러리 -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

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
                
            <li><a href="#">게시판</a>
            <ul class="sub">
          <li><a href="#" >공지사항</a></li>
         <li><a href="#">Q&A</a></li>
          <li><a href="#" onclick="location.href ='suggest?work=suggest&detailwork=suggest_main'; return false;">건의사항</a></li>
        </ul>
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
      
	
	<div align="center">
		<h1>ORDER</h1>
	</div>
	
</header>

<main style="margin-left: 200px">
	<div>
		<h2>주문상품</h2>
	</div>
	<div>
		<table border="1px solid" style="text-align: center;">
		<col width="150px"><col width="300px"><col width="100px"><col width="150px"><col width="150px">
			<tr>
				<th>상품 이미지</th><th>상품정보</th><th>수량</th><th>상품금액</th><th>총 상품금액</th>		
			</tr>		
			<tr>
				<td><img alt="이미지 없음" src="productimg/<%=dto.getFilename()%>" width="50px" height="70px"></td>
				<td>
					<table style="font-size: 14px">
						<tr>
							<td align="center"><%=dto.getP_name() %></td>
						</tr>
						<tr>
							<td>사이즈 : <%=size %> / </td><td>색상 : <%=color %></td>
						</tr>
					</table>
				</td>
				<td><%=count %>개</td>
				<td><%=dto.getP_price() %></td>
				<td><%=totalPrice %></td>
			</tr>
		</table>
	</div>
	<div style="margin-top: 70px">
		<h2>주문자 정보</h2>
	</div>
	<div>
		<table border="1px solid">
		<col width="150px"><col width="300px"><col width="100px">
			<tr>
				<th>주문 하시는분</th><td colspan="2"><input type="text" size="50" name="recName"></td>
			</tr>		
			<tr>
				<th>연락처</th><td colspan="2"><select name="phoNum1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="017">017</option>
									<option value="019">019</option>
								</select>
				
				-<input type="text" size="10" name="phoNum2">-<input type="text" size="10" name="phoNum3"></td>
				
				
			</tr>
			<tr>
				<th>이메일</th><td><input type="text" size="15" id="email1">@<input type="text" size="14" id="emailaddr"></td><td><select id="selemail">
																	<option value="">직접 입력</option>
																	<option value="gmail.com">gmail.com</option>
																	<option value="naver.com">naver.com</option>
																	<option value="daum.net">daum.net</option>
																	<option value="hotmail.com">hotmail.com</option>
																</select></td>
			</tr>
		</table>
	</div>
	<div style="margin-top: 70px">
		<h2>배송지 정보 입력</h2>
	</div>
	<div>
		<input type="checkbox" name="same" id="_same">주문자와 동일
	</div><br>
	<div>
		<table border="1px solid">
		<col width="150px"><col width="300px"><col width="100px"><col width="150px"><col width="150px">
			<tr>
				<td colspan="5"><input type="radio" name="sendwhere" value="do" checked="checked">국내배송 <input type="radio" name="sendwhere" value="ov">해외배송</td>
			</tr>		
			<tr>
				<th>받으시는 분</th><td colspan="2"><input type="text" size="30" name="receiveName"></td>				
			</tr>
			<tr>
				<th>연락처</th><td colspan="2"><select name="phoneNum1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="017">017</option>
									<option value="019">019</option>
								</select>
				
				-<input type="text" size="10" name="phoneNum2">-<input type="text" size="10" name="phoneNum3"></td>
			</tr>
			<tr>
				<th>배송 주소</th>
				<td colspan="2"><input type="text" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" size="40"><br>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소" size="40">
				</td>
			</tr>
			<tr>
				<th>배송 메세지</th><td colspan="2"><select>
										<option>배송 메세지를 선택해주세요</option>
										<option>배송 전 미리 연락 바랍니다</option>
										<option>부재시 경비실에 맡겨주세요</option>
										<option>부재시 문앞에 놓아주세요</option>
										<option>택배함에 보관해 주세요</option>
									</select><textarea rows="10" cols="100"></textarea>*주문관련 요청사항은 고객센터 또는 Q&A 게시판을 이용해주세요.</td>
			</tr>
		</table>
	</div>
	<div style="margin-top: 70px">
		<h2>결제 선택</h2>
	</div>
	<div>
		<table border="1px solid">
		<col width="150px"><col width="150px">
			<tr>
				<td><input type="radio"name="payway" checked="checked">신용 카드</td>
			</tr>
		</table>
	</div>
	<div style="width: 600px; margin-top: 70px">
		<h2>주문자 동의</h2>
		<input type="checkbox" name="checkpay">상기 결제정보를 확인하였으며, 구매진행에 동의합니다.
	</div>		
	
</main>
	<div align="center" style="margin-top: 100px">
		<button type="button" style="width: 200px; height: 60px" id="p_btn">결제 하기</button>
	</div>	
	<!-- 바닥 글 -->
	
	<div style="margin-top: 70px">
		<section class="info_section layout_padding2">
			<div class="container">
				<div class="row info_main_row">
					<!-- Menu -->
					<div class="col-md-6 col-lg-3">
						<div class="info_links">
							<h4>Menu</h4>
							<div class="info_links_menu">
								<a href="index.jsp"> Home </a> <a href="detail.jsp"> 카테고리 </a> <a
									href="contact.jsp"> 고객센터 </a> <a href="login.jsp"> 로그인 </a> <a
									href="register.jsp"> 회원가입 </a>
							</div>
						</div>
					</div>

					<!-- 회사 -->
					<div class="col-md-6 col-lg-3">
						<div class="info_detail">
							<h4>Company</h4>
							<p>
								(주)Simple Five<br>대표자: 오조<br>
								<br> 사업자 등록번호:520-02-55555<br>
								<!-- 	통신판매업 등록번호 : <br> -->
								서울특별시 강남구 테헤란로<br> 64번길2 서영빌딩1층
							</p>
						</div>
					</div>
					<!-- 고객센터 -->
					<div class="col-md-6 col-lg-3">
						<div class="info_detail">
							<h4>CS Center</h4>
							<p>
								이용약관<br> 개인정보 취급방침<br> Q&A
							</p>
						</div>
					</div>
					<!-- 고객센터 -->
					<div class="col-md-6 col-lg-3">
						<h4>Contect Us</h4>
						<div class="info_contact">
							<a href=""> <i class="fa fa-map-marker" aria-hidden="true"></i>
								<span> T. 02-223-5555 </span>
							</a> <a href=""> <i class="fa fa-phone" aria-hidden="true"></i> <span>
									M. 010-5555-5555 </span>
							</a> <a href=""> <i class="fa fa-envelope"></i> <span>
									simplefive@gmail.com </span>
							</a> <span> 평일 : am 09:00 - pm 18:00 <br> 주말 : pm 12:00 -
								pm 13:00
							</span>
						</div>
					</div>
					<!-- 고객센터 끝 -->
				</div>
			</div>
		</section>
	</div>
	<!-- 바닥글 끝-->



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
<script type="text/javascript">

$(document).ready(function() {
	$("#_same").on("click", function() {
		if($("input[name='same']").prop("checked")){
			let name = $("input[name='recName']").val();
			let phNum1 = $("select[name='phoNum1']").val();
			let phNum2 = $("input[name='phoNum2']").val();
			let phNum3 = $("input[name='phoNum3']").val();
			
			$("input[name='receiveName']").val(name);
			$("select[name='phoneNum1']").val(phNum1);
			$("input[name='phoneNum2']").val(phNum2);
			$("input[name='phoneNum3']").val(phNum3);
			
		}else{
			$("input[name='receiveName']").val("");
			$("select[name='phoneNum1']").val("010");
			$("input[name='phoneNum2']").val("");
			$("input[name='phoneNum3']").val("");
		}
	});
	
	$("#p_btn").click(function() {
		if($("input[name='checkpay']").prop("checked")==false){
			alert("주문자 동의 확인이 필요 합니다.");
		}else if($("input[name='recName']").val() =="" || $("input[name='phoNum2']").val() =="" ||$("input[name='phoNum3']").val()==""){
			alert("주문자 정보 입력이 필요합니다.");
		}else if($("input[name='receiveName']").val()=="" ||$("input[name='phoneNum2']").val()=="" || $("input[name='phoneNum3']").val()==""||
				$("#sample4_postcode").val()==""|| $("#sample4_detailAddress").val()==""){
			alert("배송지 정보를 정확하게 입력해주십시오");
		}else{
			let email = $('#email1').val()+"@"+$('#emailaddr').val()
			let name = $("input[name='recName']").val();
			let phoneNum = $("select[name='phoNum1']").val()+ $("input[name='phoNum2']").val()+$("input[name='phoNum3']").val();
			let addr = $("#sample4_roadAddress").val()+$("#sample4_detailAddress").val();
			let postcode = $("#sample4_postcode").val()
		
			$.ajax({
				url:"purchaseCon",
				type:"post",
				datatype:"json",
				data:"email="+email+"&name="+name+"&phoneNum="+phoneNum+"&addr="+addr+"&postcode="+postcode,
				success:function(data){
					let em = String(data.map.email);
					let nm = String(data.map.name);
					let pn = String(data.map.phoneNum);
					let ad = String(data.map.addr);
					let pc = String(data.map.postcode);
					
					var IMP = window.IMP; // 생략해도 괜찮습니다.
			  		IMP.init("imp80934065"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
			  		
			  	// IMP.request_pay(param, callback) 호출
			  	 	IMP.request_pay({ // param
			  	    pg: "html5_inicis",
			  	    pay_method: "card",
			  	    merchant_uid: "ORD20180131-0000011",
			  	    name: "<%=dto.getP_name()%>",
			  	    amount: "<%=totalPrice %>",
			  	    buyer_email: em,
			  	    buyer_name: nm,
			  	    buyer_tel: pn,
			  	    buyer_addr: ad,
			  	    buyer_postcode: pc
			  	  }, function (rsp) { // callback
			  	    if (rsp.success) {
			  	       
			  	    	jQuery.ajax({
			  	          url: "https://www.myservice.com/payments/complete", // 가맹점 서버
			  	          method: "POST",
			  	          headers: { "Content-Type": "application/json" },
			  	          data: {
			  	              imp_uid: rsp.imp_uid,
			  	              merchant_uid: rsp.merchant_uid
			  	          }
			  	      }).done(function (data) {
			  	        // 가맹점 서버 결제 API 성공시 로직
			  	      })
			  	    location.href = "purchaseCon?work=successpay"
			  	    } else {
			  	      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
			  	    }
			  	  });
				},
				error:function(){
					
				}
			});
			
		}
		
	});
	
	$("#selemail").change(function() {
		let email =$("#selemail").val();
		
		$("#emailaddr").val(email);
		$("#emailaddr").attr("readonly","readonly");
	});
		
});


</script>		

<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
               /*  document.getElementById("sample4_jibunAddress").value = data.jibunAddress; */
                
               
            }
        }).open();
    }
</script>

</body>
</html>