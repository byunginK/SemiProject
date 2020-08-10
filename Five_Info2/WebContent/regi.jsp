<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style>
	body {
		color: #fff;
		/* background: black; */
		background-image: url('./image/images (1).jpg');
	}
	.form-control {
		min-height: 55px;
		background: #f2f2f2;
		box-shadow: none !important;
		border: transparent;
	}
	.btn1 {
		border-radius: 10px;
        border: none; 
        outline: none !important; 
        font-weight: bold; 
        background-color: gray; 
        color: white;
	}
	.form-control:focus {
		background: #e2e2e2;
	}
	.form-control, .btn {        
        border-radius: 15px;
    }
	.regi-form {
		width: 500px;
		margin: 30px auto;
		text-align: right;
		opacity: 0.95;
		
	}
	.regi-form h2 {
        margin: 10px 0 25px;
    }
    .regi-form form {
		color: #7a7a7a;
		border-radius: 20px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 40px;
    }
    .regi-form .btn {        
        font-size: 16px;
        font-weight: bold;
		background: black;
		border: none;
        outline: none !important;
    }
	.regi-form .btn:hover, .regi-form .btn:focus {
		background: #2389cd;
	}
	.regi-form a {
		color: #fff;
		text-decoration: underline;
	}
	.regi-form a:hover {
		text-decoration: none;
	}
	.regi-form form a {
		color: #7a7a7a;
		text-decoration: none;
	}
	.regi-form form a:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
<div class="regi-form">
    <form id="frm" method="post">
        <h2 class="text-center">회원 가입</h2>   
        <div class="form-group has-error">
        	<input type="text" class="form-control" id="id" name="id" placeholder="id" required="required">
        	
        	<!-- 중복확인버튼 -->
        	 <input type="button" class="btn1" id="idBtn" name="idBtn" value="ID 중복확인" >
        	<p id="p"><b>중복확인 버튼을 눌러주세요</b></p>
        	
        </div>
               
		<div class="form-group">
            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" required="required">
        </div>
		<div class="form-group">
            <input type="text" class="form-control" id="name" name="name" placeholder="Name" required="required">
        </div> 
		<div class="form-group">
            <input type="text" class="form-control" id="email" name="email" placeholder="Email address" required="required">
        </div> 
        <div class="form-group">
            <button  id="_btnRegi" class="btn btn-primary btn-lg btn-block" value="회원가입">회원가입 하기</button>
        </div>
    </form>
    <p class="text-center small">로그인 화면으로 돌아가기 <a href="index.jsp">클릭!</a></p>
</div>
<script type="text/javascript">
$(document).ready(function() {
	//빈칸 검사
	$("#_btnRegi").click(function() {
		if ($("#id").val().trim() == "") {
			alert("id를 입력해 주십시오");
			$("#id").focus();
		}else if ($("#pwd").val().trim() == "") {
			alert("password를 입력해 주십시오");
			$("#pwd").focus();
		}else if ($("#name").val().trim() == "") {
			alert("이름을 입력해 주십시오");
			$("#name").focus();
		}else if ($("#email").val().trim() == "") {
			alert("email 주소를 입력해 주십시오");
			$("#email").focus();
		}else {
			//$("#frm").submit();
			$("#frm").attr("action", "regiAf.jsp").submit();

		}
	});
	
	
	//id중복 확인
	$("#idBtn").click(function () {
		
			$.ajax({
				type:"post",
				url:"./idcheck.jsp",
			//	data:"id=" + $("#id").val(),
				data:{ "id":$("#id").val() },
				success:function( data ){
				//	alert("success");
				//	alert(data.trim());
					if(data.trim() == "YES"){
						$("#idcheck").css("color", "#0000ff");
						$("#idcheck").html('사용할 수 있는 id입니다');
					}else{
						$("#idcheck").css("color", "#ff0000");
						$("#idcheck").html('사용 중인 id입니다');
						$("#id").val("");
					}			
				},
				error:function(){
					alert("error");
				}
			});
		});
	
	
});

</script>
</body>
</html>














