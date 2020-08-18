<%@page import="util.calUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto) session.getAttribute("login_Dto");
//MemberDto mem = new MemberDto("a",1); 
	
    Calendar cal = Calendar.getInstance();

    String syear = (request.getParameter("year")==null)?"":request.getParameter("year");
    String smonth = (request.getParameter("month")==null)?"":request.getParameter("month");

    int year = cal.get(Calendar.YEAR);
    if(!syear.equals("") ) year = Integer.parseInt(syear);

    // month -1 하지말고 0~11로 계산하기
    int month = cal.get(Calendar.MONTH);
    if(!smonth.equals("") )month = Integer.parseInt(smonth);

   // System.out.println("year = "+year+", month ="+month);
    
    if(month < 0){
        month = 11;
        year--;
    }
    if(month>11){
        month=1;
        year++;
    }

    cal.set(Calendar.YEAR, year);
    cal.set(Calendar.MONTH, month);
    cal.set(Calendar.DATE, 1);

    // 1(일) ~ 7(토)
    int startday = cal.get(Calendar.DAY_OF_WEEK);
    int lastday = cal.getMaximum(Calendar.DAY_OF_MONTH);
    //System.out.println("main = " +startday +" " + lastday);

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
 
<title>일정 확인</title>
<script type="text/javascript" src ="<%=request.getContextPath() %>/jquery/jquery-3.5.1.min.js"></script>
<style type="text/css">
#caltb tr{
height:60px;
}
td{
text-align:left;
}
tg{
text-align:left;
}
a{
	text-decoration:none;
}
ul li:before {
	content : "√ ";
}
ul li{
	font-size:10pt;
	margin-left:-30px;
}
h3{
	background-color: #f0f0f0;
	text-align: center !import;
}
.table-header {
    background-color: #95A5A6;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.03em;
    opacity:0.7;
}
#intb{
	width:150px;
	height:120px;
	table-layout:fixed;
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

<h3>일정 공지</h3>

<hr>

<div id="calcontainer">
<%
String s = calUtil.getcalList(year,month,startday,lastday);
//System.out.println(s);
%>
</div>

<script type="text/javascript">
function popfunc(data){
	//console.log(data);
    window.open("cal_popup.jsp?totdate="+data,"all","width=300, height=300, left=200, top=150, resizable=no, toolbakrs=no, menubar=no");
}
$(document).ready(function(){
	$("#calcontainer").html("<%=s%>");
});

</script>
</body>
</html>