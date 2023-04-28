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
    <script> //정규식만 완성시키면 끝 
    	'use strict';
    	let require="필수 정보 입니다.";
    	let regexCheck="조건에 맞게 작성해주세요.";
    	let pwdDouCheck="비밀번호와 일치하지 않습니다.";
    	function idCheck(){
			let id=document.getElementById("mid").value.trim();
			const regex=;
			
			if(!regex.test(id)){
				document.getElementById("hidP1").innerHTML=regexCheck;
				document.getElementById("hidP1").style.display="block";
			} 
			
    	}
    	
    	function pwdCheck(){
			let pwd=document.getElementById("pwd").value.trim();
			const regex=;
			
			if(!regex.test(id)){
				document.getElementById("hidP2").innerHTML=regexCheck;
				document.getElementById("hidP2").style.display="block";
			} 
    	}
    	
    	function pwd2Check(){
    		let pwd=document.getElementById("pwd").value.trim();
			let pwd2=document.getElementById("pwd2").value.trim();
			const regex=;
			
			if(pwd==pwd2){
				document.getElementById("hidP3").innerHTML=pwdDouCheck;
				document.getElementById("hidP3").style.display="block";
			} 
    	}
    	
    	function nameCheck(){
			let id=document.getElementById("name").value.trim();
			const regex=;
			
			if(!regex.test(id)){
				document.getElementById("hidP4").innerHTML=regexCheck;
				document.getElementById("hidP4").style.display="block";
			} 
    	}
    	
    	function birthdayCheck(){
			let id=document.getElementById("birthday").value.trim();
			const regex=;
			
			if(!regex.test(id)){
				document.getElementById("hidP5").innerHTML=regexCheck;
				document.getElementById("hidP5").style.display="block";
			} 
    	}
    	
    	function genderCheck(){
			let id=document.getElementById("gender").value.trim();
			const regex=;
			
			if(!regex.test(id)){
				document.getElementById("hidP6").innerHTML=regexCheck;
				document.getElementById("hidP6").style.display="block";
			} 
    	}
    	
    	function blankCheck(){
    		let id=document.getElementById("mid").value.trim();
    		let pwd=document.getElementById("pwd").value.trim();
    		let pwd2=document.getElementById("pwd2").value.trim();
    		let name=document.getElementById("name").value.trim();
    		let birthday=document.getElementById("birthday").value.trim();
    		let gender=document.getElementById("gender").value.trim();
    		
    		
    		if(id=="") document.getElementById("hidP1").style.display="block";
    		if(pwd=="") document.getElementById("hidP2").style.display="block";
    		if(pwd2=="") document.getElementById("hidP3").style.display="block";
    		if(name=="") document.getElementById("hidP4").style.display="block";
    		if(birthday=="") document.getElementById("hidP5").style.display="block";
    		if(gender=="") document.getElementById("hidP6").style.display="block";
    		
    		if(id!=""&&pwd!=""&&pwd2!=""&&name!=""&&birthday!=""&&gender!=""){
    			myform.submit();
    		}
    	}
    </script>
    <style>
    	body{
    		background-color:#FDEBC8;
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
		.hiddentext{
			text-align:left;
			color:red;
			margin-left:10px;
			display:none;
		}
    </style>
</head>
<body>
    <div class="container text-center" id="login">
        <div>
            <form action="<%=request.getContextPath()%>/LegisterOk" name="myform" method="post" >
	            <div id="a">
	            	<div class="rows label id">아이디</div>
	            	<div class="rows"><input type="text" class="form-control" value="" id="mid" name="mid" placeholder="아이디를 입력하세요" autofocus></div>
	            	<div class="rows"><p class="hiddentext" id="hidP1">필수 정보입니다.</p></div>
	               	<div class="rows mt-2 label">비밀번호</div>
	               	<div class="rows"><input type="password" class="form-control" value="" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" autofocus></div>
	               	<div class="rows"><p class="hiddentext" id="hidP2">필수 정보입니다.</p></div>
	               	<div class="rows mt-2 label">비밀번호 확인</div>
	               	<div class="rows"><input type="password" class="form-control" value="" id="pwd_check" name="pwd_check" placeholder="비밀번호 한번 더 입력하세요" autofocus></div>
	               	<div class="rows"><p class="hiddentext" id="hidP3">필수 정보입니다.</p></div>
	            	<div class="rows mt-2 label">이름</div>
	               	<div class="rows"><input type="text" class="form-control" value="" id="name" name="name" placeholder="이름을 입력하세요" autofocus></div>
	               	<div class="rows"><p class="hiddentext" id="hidP4">필수 정보입니다.</p></div>
	            	<div class="rows mt-2 label">생년월일</div>
	               	<div class="rows">
	               		<input type="text" class="form-control birthday birthday" value="" id="since" name="since" placeholder="년(4자)" autofocus>
	               		<select class="form-control birthday" id="month" name="month">
	               			<option value="">월</option>
	               			<option>1월</option>
	               			<option>2월</option>
	               			<option>3월</option>
	               			<option>4월</option>
	               			<option>5월</option>
	               			<option>6월</option>
	               			<option>7월</option>
	               			<option>8월</option>
	               			<option>9월</option>
	               			<option>10월</option>
	               			<option>11월</option>
	               			<option>12월</option>
	               		</select>
	               		<input type="text" class="form-control birthday" value="" id="day" name="day" placeholder="" autofocus>
	               	</div>
	               	<div class="rows"><p class="hiddentext" id="hidP5">필수 정보입니다.</p></div>
	               	<div class="rows label" id="gender">성별</div>
	               	<div class="rows">
	               		<select class="form-control">
	               			<option value="">성별</option>
	               			<option value="">남자</option>
	               			<option value="">여자</option>
	               			<option value="">선택안함</option>
	               		</select>
	               	</div>
	               	<div class="rows"><p class="hiddentext" id="hidP6">필수 정보입니다.</p></div>
	                <div class="rows"><input type="submit" value="회원가입" class="btn btn-success pl-4 pr-4 mt-4"></div> <!-- onclick="blankCheck()" -->
	            </div>
            </form>
        </div>
    </div>
</body>
</html>