<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container div-board div-fullsize">
		<c:if test="${boardCode eq 'qna'}">
			<h3>인테리어 노하우</h3>
		</c:if>
		<c:if test="${boardCode eq 'inquiry'}">
			<h3>1:1 문의</h3>
		</c:if>
		<c:if test="${boardCode eq 'notice'}">
			<h3>공지사항</h3>
		</c:if>
		<c:if test="${boardCode eq 'counsel'}">
			<h3>리모델링 상담</h3>
		</c:if>
		<hr />
		<c:forEach var="board" items="${boards.content}">
			<div class="div-boardlist">
				<span>
					<a href="/board/${board.id}">${board.title}</a>
				</span>
				<span class="span-boardlist-right">
					<font>${board.user.name}</font>&nbsp;&nbsp;&nbsp;
					<font><fmt:formatDate value="${board.createDate}" pattern="yyyy.MM.dd" /></font>&nbsp;&nbsp;&nbsp;
					<font>${board.count}</font>&nbsp;&nbsp;&nbsp;
				</span>
			</div>
			<hr />
		</c:forEach>
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${boards.first}">
					<li class="page-item disabled"><a class="page-link" href="?page=${boards.number-1}"> ◀ </a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="?page=${boards.number-1}"> ◀ </a></li>
				</c:otherwise>
			</c:choose>
			<li class="page-item"><a class="page-link" href="?page=${boards.number}"> ${boards.number+1} </a></li>
			<c:choose>
				<c:when test="${boards.last}">
					<li class="page-item disabled"><a class="page-link" href="?page=${boards.number+1}"> ▶ </a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="?page=${boards.number+1}"> ▶ </a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<div class="div-btn">
			<p></p>
			<c:if test="${boardCode ne 'notice'}">
				<a class="btn" href="/user/write/${boardCode}">질문하기</a>
			</c:if>
			<c:if test="${boardCode eq 'notice' && principal.user.role eq 'ROLE_ADMIN'}">
				<a class="btn" href="/admin/write/notice">공지 작성하기</a>
			</c:if>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>