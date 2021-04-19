<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container-sm div-mypage">
		<br/><br/><h1>마이페이지</h1><br/><br/>
		<p>${principal.user.email}</p>
		<p>${principal.user.name}</p>
		<p>${principal.user.address}</p>
		<p>${principal.user.phonenum}</p>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>