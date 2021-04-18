<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container div-itemdetail">
		<button class="btn btn-outline-light" onclick="history.back()">목록으로</button>
		<h3>${product.title}</h3>
		<h3>${product.lprice}</h3>
		<img alt="" src="${product.image }" style="width: 300px">
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>