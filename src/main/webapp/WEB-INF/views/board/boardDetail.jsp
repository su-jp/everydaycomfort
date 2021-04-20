<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container div-board-detail">
		<div class="div-fullsize">
			<c:if test="${board.board eq 'qna'}">
				<h3>인테리어 노하우</h3>
			</c:if>
			<c:if test="${board.board eq 'inquiry'}">
				<h3>1:1 문의</h3>
			</c:if>
			<c:if test="${board.board eq 'notice'}">
				<h3>공지사항</h3>
			</c:if>
			<c:if test="${board.board eq 'counsel'}">
				<h3>리모델링 상담</h3>
			</c:if>
			<hr />
			<div class="div-article-info div-article-padding">
				<span> ${board.user.name}&nbsp; <fmt:formatDate value="${board.createDate}" pattern="yyyy.MM.dd" />&nbsp;작성
				</span> <span> 조회수 ${board.count}</span>
			</div>
			<hr />
			<div class="div-article-title div-article-padding">
				<h5>${board.title}</h5>
			</div>
			<hr />
			<div class="div-article-content div-article-padding">
				<p>${board.content}</p>
			</div>
		</div>
		<hr />
		<div class="div-article-comment">
			<c:choose>
				<c:when test="${empty principal}">
					<p>댓글을 작성하려면 로그인 해주세요.</p>
				</c:when>
				<c:otherwise>
					<form>
						<input type="hidden" id="userId" value="${principal.user.id}" /> <input type="hidden" id="boardId" value="${board.id}" />
						<div>
							<h6>댓글</h6>
							<textarea id="commentContent" class="form-control" rows="3" style="resize: none;"></textarea>
						</div>
					</form>
					<div class="div-btn">
						<p></p>
						<button type="button" onclick="commentSave()" class="btn btn-outline-dark">등록</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>