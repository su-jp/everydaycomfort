<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container">
		<h1>게시글 조회 페이지</h1>
		<h3>${board.title }</h3>
		<h3>${board.user.name }</h3>
		<p>${board.content }</p>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>