<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>회원가입</title>
    <script>
    	'use strict';
    	function Check(){
    		let mid=document.getElementById("mid").value.trim();
    		let pwd=document.getElementById("pwd").value.trim();
    		if(mid==""&&pwd==""){
    			alert("아이디와 비밀번호를 입력하세요.");
    			return false;
    		} else if(mid==""){
    			alert("아이디를 입력하세요.");
    			return false;
    			myform.mid.focus();
    		} else if(pwd==""){
    			alert("비밀번호를 입력하세요.");
    			myform.pwd.focus();
    			return false;
    		}
    		myform.submit();
    	}
    </script>
    <style>
    	body{
    		background-color:magenta;
    	}
    	#login{
    		background-color:white;
    		width:500px;
    		height:700px;
    		margin-top:32px;
    		border-radius: 30px;
    	
    	}
        #mainlogo{
            width:350px;
            text-align: center;
            margin-bottom:50px;
        }
        .label{
        	text-align:left;
        }
		.rows{
			width:350px;
			margin: 0 auto;
		}
		.birthday{
			width:110px;
			float:left;
		}
		#since, #month{
			margin-right:10px;
		} 
		.since{
			width:50px;
		}
		#gender{
			margin-top:45px;
		}
		#a{
			padding-top:100px;
		}
    </style>
</head>
<body>
    <div class="container text-center" id="login">
        <div>
            <form action="<%=request.getContextPath()%>/loginOk" name="myform" method="post" >
	            <div id="a">
	            	<div class="rows label id">아이디</div>
	            	<div class="rows"><input type="text" class="form-control" value="" id="mid" name="mid" placeholder="아이디를 입력하세요" autofocus></div>
	               	<div class="rows mt-2 label">비밀번호</div>
	               	<div class="rows"><input type="password" class="form-control" value="" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" autofocus></div>
	               	<div class="rows mt-2 label">비밀번호 확인</div>
	               	<div class="rows"><input type="password" class="form-control" value="" id="pwd_check" name="pwd_check" placeholder="비밀번호 한번 더 입력하세요" autofocus></div>
	            	<div class="rows mt-2 label">이름</div>
	               	<div class="rows"><input type="text" class="form-control" value="" id="name" name="name" placeholder="이름을 입력하세요" autofocus></div>
	            	<div class="rows mt-2 label">생년월일</div>
	               	<div class="rows">
	               		<input type="text" class="form-control birthday birthday" value="" id="since" name="since" placeholder="년(4자)" autofocus>
	               		<select class="form-control birthday" id="month" name="month">
	               			<option value="">월</option>
	               			<option value="">1월</option>
	               			<option value="">2월</option>
	               			<option value="">3월</option>
	               			<option value="">4월</option>
	               			<option value="">5월</option>
	               			<option value="">6월</option>
	               			<option value="">7월</option>
	               			<option value="">8월</option>
	               			<option value="">9월</option>
	               			<option value="">10월</option>
	               			<option value="">11월</option>
	               			<option value="">12월</option>
	               		</select>
	               		<input type="text" class="form-control birthday" value="" id="day" name="day" placeholder="" autofocus>
	               	</div>
	               	<div class="rows label" id="gender">성별</div>
	               	<div class="rows">
	               		<select class="form-control">
	               			<option value="">성별</option>
	               			<option value="">남자</option>
	               			<option value="">여자</option>
	               			<option value="">선택안함</option>
	               		</select>
	               	</div>
	                <div class="rows"><input type="button" value="회원가입" onclick="Check()" class="btn btn-success pl-4 pr-4 mt-4"></div>
	            </div>
            </form>
        </div>
    </div>
</body>
</html>