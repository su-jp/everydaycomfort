<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<% %>
<div class="main-div">
	<div class="container div-test">
		<c:forEach var="product" items="${list.content}">
			<div>
				<h5>${product.title}</h5>
				<img alt="item" src="${product.image}" style="width: 300px">
				<p>${product.lprice}</p>
			</div>
		</c:forEach>
		<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${list.first}">
							<li class="page-item disabled"><a class="page-link" href="?page=${list.number-1}"> ◀ </a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="?page=${list.number-1}"> ◀ </a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${list.last}">
							<li class="page-item disabled"><a class="page-link" href="?page=${list.number+1}"> ▶ </a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="?page=${list.number+1}"> ▶ </a></li>
						</c:otherwise>
					</c:choose>
				</ul>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>