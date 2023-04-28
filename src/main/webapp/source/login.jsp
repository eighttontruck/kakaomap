<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0; i<cookies.length;i++){
			if(cookies[i].getName().equals("cId")){
				pageContext.setAttribute("id",cookies[i].getValue());
				break;
			}
		}
	}
%>
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
    <title>로그인</title>
    <script>
    	'use strict';
    	function Check(){
    		let id=document.getElementById("id").value.trim();
    		let pwd=document.getElementById("pwd").value.trim();
    		if(id==""&&pwd==""){
    			alert("아이디와 비밀번호를 입력하세요.");
    			return false;
    		} else if(id==""){
    			alert("아이디를 입력하세요.");
    			return false;
    			myform.id.focus();
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
    </style>
</head>
<body>
    <div class="container text-center" id="login">
        <div>
            <img src="../images/mainlogo.jpeg" id="mainlogo" alt="">
        </div>
        <div>
            <form action="<%=request.getContextPath()%>/loginOk" name="myform" method="post" >
	            <div id="a">
	            	<div class="rows label">아이디</div>
	            	<div class="rows"><input type="text" class="form-control" value="${id}" id="id" name="id" placeholder="아이디를 입력하세요" autofocus></div>
	               	<div class="rows mt-2 label">비밀번호</div>
	               	<div class="rows"><input type="password" class="form-control" value="" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" autofocus></div>
	                <div class="rows label mt-2"><p>계정이 없다면? <a href="legister.jsp">회원가입</a>하기</p></div>
	                <div class="rows"><input type="button" value="로그인" onclick="Check()" class="btn btn-success pl-4 pr-4"></div>
	                <div class="rows"><input type="checkbox" name="idSave"/>아이디 저장</div>
	            </div>
            </form>
        </div>
    </div>
</body>
</html>