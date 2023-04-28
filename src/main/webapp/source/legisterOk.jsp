<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	alert(`${vo.name}님 정상적으로 회원가입 완료`);
	location.href="<%=request.getContextPath()%>/source/login.jsp";
</script>