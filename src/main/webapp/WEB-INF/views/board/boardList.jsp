<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container div-board">
		<c:if test="${boardCode eq 'qna'}">
			<h3>질문과 답변</h3>
			<h4>
				편안한가에서 제공하는 인테리어 상담 서비스!<br />지금 바로 방 안에서 인테리어 전문가에게 조언을 받아보세요.
			</h4>
		</c:if>
		<c:if test="${boardCode eq 'inquiry'}">
			<h3>1:1 문의</h3>
		</c:if>
		<c:if test="${boardCode eq 'notice'}">
			<h3>공지사항</h3>
		</c:if>
		<c:if test="${boardCode eq 'counsel'}">
			<h3>리모델링 상담</h3>
			<h4>
				편안한가에서 제공하는 리모델링 상담 서비스!<br />견적 문의부터 방문 일정 조율까지 원스톱으로 진행해드립니다.
			</h4>
		</c:if>
		<hr />
		<c:forEach var="board" items="${boards.content}">
			<div class="div-boardlist">
				<a href="/board/${board.id}">${board.title}</a>
				<hr />
			</div>
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
		<c:if test="${boardCode ne 'notice'}">
			<a class="btn btn-primary" href="/user/write/${boardCode}">질문하기</a>
		</c:if>
		<c:if test="${boardCode eq 'notice' && principal.user.role eq 'ROLE_ADMIN'}">
			<a class="btn btn-primary" href="/admin/write/notice">공지 작성하기</a>
		</c:if>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>