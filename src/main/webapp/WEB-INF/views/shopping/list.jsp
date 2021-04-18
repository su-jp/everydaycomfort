<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<% %>
<div class="main-div">
	<div class="container div-test">
		<c:forEach var="product" items="${list}">
			<div>
				<h5>${product.title}</h5>
				<img alt="item" src="${product.image}" style="width: 300px">
				<p>${product.lprice}</p>
			</div>
		</c:forEach>
	
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>