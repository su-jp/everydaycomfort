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
			<h3>1:1 문의 게시판</h3>
		</c:if>
		<hr />
		<c:forEach var="board" items="${boards.content}">
			<div class="div-boardlist">
				<a href="/board//${board.id}">${board.title}</a>
			</div>
		</c:forEach>
		<hr />
		<c:if test="${boardCode ne 'notice'}">
			<a class="btn btn-primary" href="/user/write/${boardCode}">질문하기</a>
		</c:if>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>