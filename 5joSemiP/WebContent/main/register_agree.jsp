<%@page import="dto.MemberDto"%>
<%@page import="dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%=request.getContextPath() %> --%>
    <%
    /* 세션에서 아이디 받아옴 로그인을 안할시 null */
    String id = null; int auth = 3;
     MemberDto login_Dto = null;
       if(session.getAttribute("login_Dto") != null){
    	   login_Dto = (MemberDto)session.getAttribute("login_Dto");
    	   id = login_Dto.getId(); auth = login_Dto.getAuth();
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

  <title>Register</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

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

<!-- 바디 셋팅 -->
<body class="sub_page">

  <div class="main_body_content">

    <div class="hero_area">
    
      <!-- 헤더 -->
      <header class="header_section">
        <div class="container-fluid">
        <!-- 네비게이션 바 -->
          <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="../addPro?work=main">
              Simple Five
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            	<span class=""></span>
            </button>
           <div class="collapse navbar-collapse " id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="../addPro?work=main">Main<span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="../addPro?work=list">카테고리</a>
                </li>
                 <!-- 일단 임시로 만들었어요 수정필요  게시판 이동-->
                 <li class="nav-item">
                	<div class="dropdown">
						<p class="dropdown-p">고객센터</p>
						<div class="dropdown-content">
							<a href="<%=request.getContextPath()%>/board/qna_main.jsp">Q & A</a>
							<a href="../infomain?work=move">공지사항</a>
							<a href="../suggest?work=suggest&detailwork=suggest_main" >건의사항</a>
							<a href="<%=request.getContextPath()%>/calendar/cal_main.jsp">일정확인</a>
						</div>
					</div>
                </li>
                 <!-- 게시판 이동 끝 -->
         
          <!--로그인을 하면 세션에 저장 -> 세션값이 없으면 로그인/회원가입  있으면 마이페이지/로그아웃 -->
             <% if(id != null){ 
                     if(auth == 1){%>
                <li class="nav-item">
                  <a class="nav-link" href="<%=request.getContextPath()%>/admin/admin_main.jsp">관리자페이지</a>
                </li>
             <%} else{%>
             <li class="nav-item">
                  <a class="nav-link" href="../login?work=MyPage&id=<%=id%>">My Page</a>
                </li>
                <%} %>
   				<li class="nav-item">
                  <a class="nav-link" href="../login?work=logout">로그아웃</a>
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




  <!-- 회원가입창 -->

    <section class="contact_section_regi_agree layout_padding">
        
			<div class="regi-form">
		<!-- <div id="wrapper_title">회원가입약관</div> -->
		<h2>회원가입약관</h2>


		<!-- 회원가입약관 동의 시작  -->
		<div>

			<form action="register.jsp" method="POST" onsubmit="return fregister_submit(this);">

				<p>회원가입약관 및 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.</p>
				<div id="fregister_chkall">
					<input type="checkbox" name="chk_all" value="1" id="chk_all">&nbsp;&nbsp;전체선택

				</div>
				<section id="fregister_term">
					<h6>
						<i class="fa fa-check-square-o" aria-hidden="true"></i> 회원가입약관
					</h6>
					<textarea class="area" readonly>제1장 총칙
제1조(목적)
본 약관은 ((주)심플파이브) 홈페이지가 제공하는 모든 서비스의 이용조건 및 절차, 이용자와 (주)심플파이브의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관의 효력과 변경)
(주)심플파이브는 귀하가 본 약관 내용에 동의하는 경우, 심플파이브의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다. (주)심플파이브는 본 약관을 사전 고지 없이 변경할 수 있으며, 변경된 약관은 심플파이브 홈페이지 내에 공지하고, 공지와 동시에 그 효력이 발생됩니다. 회원이 변경된 약관에 동의하지 않는 경우, 본인의 회원등록을 취소(회원탈퇴)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주됩니다. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회 심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.

제 3 조 (용어의 정의)
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.

- 이용자 : 본 약관에 따라 심플파이브가 제공하는 서비스를 받는 자.
- 가입 : (주)심플파이브가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위
- 회원 : (주)심플파이브가 개인 정보를 제공하여 회원 등록을 한 자로서 (주)심플파이브가 제공하는 서비스를 이용할 수 있는 자.
- 아이디 : 이용고객의 식별과 이용자가 서비스 이용을 위하여 이용자가 선정하고 당 사이트가 부여하는 문자와 숫자의 조합.
- 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합.
- 탈퇴 : 회원이 이용계약을 종료시키는 행위.
제2장 서비스 제공 및 이용
제 4 조 (이용계약의 성립 및 탈퇴)
이용계약은 신청자가 온라인으로 심플파이브에서 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다. (주)심플파이브는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.

① 다른 사람의 명의를 사용하여 신청하였을 때
② 이용계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때
③ 다른 사람의 (주)심플파이브 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때
④ (주)심플파이브를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우
⑤ 기타 심플파이브이 정한 이용신청요건이 미비 되었을 때
제 5 조 (회원정보 사용에 대한 동의)
회원의 개인정보는 공공기관의 개인정보보호에 관한 법률에 의해 보호됩니다. (주)심플파이브의 회원 정보는 다음과 같이 사용, 관리, 보호됩니다.

①개인정보의 사용 : (주)심플파이브는 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 심플파이브에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.
②개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다.
③개인정보의 보호 : 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의 ID와 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 안 되며, 작업 종료 시에는 반드시 로그아웃 해주시기 바랍니다. 회원이 본 약관에 따라 이용신청을 하는 것은, 심플파이브가 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주됩니다.
제 6 조 (사용자의 정보 보안)
가입 신청자가 심플파이브 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다. ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 (주)심플파이브에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다. 이용자는 심플파이브 서비스의 사용 종료 시마다 정확히 접속을 종료해야 하며, 정확히 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 (주)심플파이브는 책임을 부담하지 아니합니다.

제 7 조 (서비스의 중지)
(주)심플파이브는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다.
(주)심플파이브가 통제할 수 없는 사유로 인한 서비스중단의 경우(시스템관리자의 고의, 과실 없는 디스크장애, 시스템다운 등)에 사전통지가 불가능하며 타인(통신회사, 기간통신사업자 등)의 고의, 과실로 인한 시스템중단 등의 경우에는 통지하지 않습니다.
긴급한 시스템 점검, 증설 및 교체 등 부득이한 사유로 인하여 예고 없이 일시적으로 서비스를 중단할 수 있으며, 새로운 서비스로의 교체 등 당 사이트가 적절하다고 판단하는 사유에 의하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다.
국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 제공이 불가능할 경우, 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다. 다만 이 경우 그 사유 및 기간 등을 이용자에게 사전 또는 사후에 공지합니다.

제 8 조 (서비스의 변경 및 해지)
(주)심플파이브는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다. 
(주)심플파이브는 서비스 이용과 관련하여 가입자에게 발생한 손해 중 가입자의 고의, 과실에 의한 손해에 대하여 책임을 부담하지 아니합니다.

제 9 조 (게시물의 저작권)
귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다. 
(주)심플파이브는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며, 게시판운영원칙에 따라 사전 통지 없이 삭제할 수 있습니다. 
귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다.

제 3 장 의무 및 책임
제 10 조 (심플파이브의 의무)
(주)심플파이브는 회원의 개인 신상 정보를 본인의 승낙 없이 타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.

제 11 조 (회원의 의무)
회원은 당 사이트의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다. 
회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 귀하에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 ID 및 비밀번호를 제3자가 이용하게 해서는 안 됩니다.
회원은 당 사이트 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안 됩니다.

다른 회원의 비밀번호와 ID를 도용하여 부정 사용하는 행위
저속, 음란, 모욕적, 위협적이거나 타인의 Privacy를 침해할 수 있는 내용을 전송, 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위
서비스를 통하여 전송된 내용의 출처를 위장하는 행위
법률, 계약에 의해 이용할 수 없는 내용을 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위
타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위
당 사이트의 승인을 받지 아니한 광고, 판촉물, 스팸메일, 행운의 편지, 피라미드 조직 기타 다른 형태의 권유를 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위
다른 사용자의 개인정보를 수립 또는 저장하는 행위
범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
선량한 풍속, 기타 사회질서를 해하는 행위
타인의 명예를 훼손하거나 모욕하는 행위
타인의 지적재산권 등의 권리를 침해하는 행위
해킹행위 또는 컴퓨터바이러스의 유포행위
타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위
서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
당 사이트에 게시된 정보의 변경. 
기타 전기통신사업법 제53조 제1항과 전기통신사업법 시행령 16조(불온통신)에 위배되는 행위

제 4 장 기타
제 12 조 (양도금지)
회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.

제 13 조 (손해배상)
심플파이브는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 (주)심플파이브가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.

제 14 조 (면책조항)
해당 사이트는 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다. 
해당 사이트는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다. 
해당 사이트는 이용자의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 회원이 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다. 
(주)심플파이브는 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. 심플파이브는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다. 
(주)심플파이브는 회원 간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 혹은 금전적 거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다. 
(주)심플파이브는 서비스 이용과 관련하여 귀하에게 발생한 손해 중 귀하의 고의, 과실에 의한 손해에 대하여 책임을 부담하지 아니합니다.

제 15 조 (재판관할)
(주)심플파이브와 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.

부 칙 1. (시행일) 본 약관은 2019년 1월 1일부터 시행됩니다.</textarea>
						<input type="checkbox" name="agree" value="1" id="agree11">&nbsp;&nbsp;회원가입약관의 내용에 동의합니다.
				</section>

				<section id="fregister_private">
					<h6>
						<i class="fa fa-check-square-o" aria-hidden="true"></i> 개인정보처리방침안내
					</h6>
					<div>

						<textarea class="area" readonly>'(주)심플파이브'(이하 '회사')는 고객님의 개인정보를 중요시하며, &#034;정보통신망 이용촉진 및 정보보호&#034;에 관한 법률을 준수하고 있습니다. 
회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

본 방침은 : 2019 년 01 월 01 일 부터 시행됩니다.



개인정보취급방침의 순서는 다음과 같습니다.

1. 수집하는 개인정보 항목
2. 개인정보의 수집 및 이용목적
3. 개인정보의 보유 및 이용기간
4. 개인정보의 파기절차 및 방법
5. 개인정보 제공
6. 수집한 개인정보의 위탁
7. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항
8. 개인정보에 관한 민원서비스


1. 수집하는 개인정보 항목
회사는 상담신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.

＊ 수집항목
- 수집항목 : 아이디, 이름, 주소, 집전화, 휴대전화, 이메일 등
- 개인정보 수집방법 : 홈페이지 (회원가입, 게시판, 구매 등)
2. 개인정보의 수집 및 이용목적
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

제품 구매, 게시판 등의 서비스 제공
개인정보의 보유 및 이용기간
회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.

4. 개인정보의 파기절차 및 방법
회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.

＊ 파기절차
- 회원님이 상담신청 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.
＊ 파기방법
- 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
5. 개인정보 제공
회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.

- 이용자들이 사전에 동의한 경우
- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
6. 수집한 개인정보의 위탁
회사는 고객님의 동의없이 고객님의 정보를 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다

7. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항
쿠키 등 인터넷 서비스 이용 시 자동 생성되는 개인정보를 수집하는 장치를 운영하지 않습니다.

8. 개인정보에 관한 민원서비스
회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.

전화상담은 평일 오전 9시~오후 6시에 이용가능 합니다.
기타 개인정보에 관한 상담이 필요한 경우에는 개인정보침해신고센터, 대검찰청 인터넷 범죄수사센터, 경찰청 사이버범죄수사대 등으로 문의하실 수 있습니다.
* 개인정보침해신고센터
- 전화번호 : 1336
- URL : http://www.cyberprivacy.or.kr
* 대검찰청 인터넷범죄수사센터
- 전화 : 02-3480-3600
- URL : http://icic.sppo.go.kr
* 경찰청 사이버범죄수사대
- URL : http://www.police.go.kr</textarea>
					</div>
						 <input type="checkbox" name="agree2" value="1" id="agree21">&nbsp;&nbsp;개인정보처리방침안내의 내용에 동의합니다.
				</section>

				<div class="btn_confirm">
					<input type="submit" class="btn btn-primary btn-lg btn-block" value="회원가입" id="regi_agree_check">
				</div>

			</form>
		</div>
		<!-- 회원가입 약관 동의 끝 -->

	</div>
		       

              
    </section>
    <!-- 회원가입 끝 -->



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
                <a href="../addPro?work=main">
                  Home
                </a>
                <a href="../addPro?work=list">
                  	카테고리
                </a>
                <a href="../infomain?work=move">
                  	공지사항
                </a>
                <% if(id != null){ 
                     if(auth == 1){%>
                  <a href="<%=request.getContextPath()%>/admin/admin_main.jsp">관리자페이지</a>
            	 <%} else{%>
                  <a href="../login?work=MyPage&id=<%=id%>">My Page</a>
                <%} %>
              <%
             }else{ %>
                  <a href="<%=request.getContextPath()%>/main/login.jsp">로그인</a>
                <%} %>
                <a href="<%=request.getContextPath()%>/main/register_agree.jsp">
                  	회원가입
                </a>
              </div>
            </div>
          </div>

<!-- 회사 -->          
          <div class="col-md-6 col-lg-3">
            <div class="info_detail">
              <h4>
                SimpleFive
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
                  M. 010-3976-0000
                </span>
              </a>
              <a href="">
                <i class="fa fa-envelope"></i>
                <span>
                  bitcamp5j0@gmail.com
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
  <!-- footer section -->


<!-- sweetalert -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%if(id != null){ %>
<script>
swal("로그인된 상태입니다.").then(function() {
	location.href = "../FirstOpen.jsp";
});
</script>
<%} %>

  <!-- ajax -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <!-- cookie 아이디저장 -->
  <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
  <!-- jQery -->
  <!-- <script src="../js/jquery-3.4.1.min.js"></script> -->
 <script type="text/javascript" src ="<%=request.getContextPath() %>/jquery/jquery-3.5.1.min.js"></script>
  <!-- bootstrap js -->
  <script src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
  <!-- slick slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
  <!-- custom js -->
  <script src="<%=request.getContextPath() %>/js/custom.js"></script>

<!-- 회원가입 체크박스 확인 -->
			<script>
				function fregister_submit(f) {
					if (!f.agree.checked) {
						swal("","회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.","warning");
						f.agree.focus();
						return false;
					}

					if (!f.agree2.checked) {
						swal("","개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.","warning");
						f.agree2.focus();
						return false;
					}

					return true;
				}

				jQuery(function($) {
					// 모두선택
					$("input[name=chk_all]").click(function() {
						if ($(this).prop('checked')) {
							$("input[name^=agree]").prop('checked', true);
						} else {
							$("input[name^=agree]").prop("checked", false);
						}
					});
				});
				

			</script>


</body>

</html>