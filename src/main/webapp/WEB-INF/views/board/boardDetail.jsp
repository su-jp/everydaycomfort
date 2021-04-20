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
			<div>
				<a href="/${board.board}" class="btn btn-outline-light text-dark">＜＜ 목록으로</a>
			</div>
			<hr />
			<div class="div-article-info div-article-padding">
				<span> ${board.user.name}&nbsp; <fmt:formatDate value="${board.createDate}" pattern="yyyy년 MM월 dd일" />&nbsp;작성
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
		<c:if test="${board.user.id == principal.user.id}">
			<div class="div-article-btn" align="right">
				<a href="/api/board/${board.id}/updateForm" class="btn btn-outline-dark">수정</a>
				<button id="${board.id}" onclick="boardDelete()" class="btn btn-outline-dark">삭제</button>
			</div>
		</c:if>
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
						<button type="button" onclick="commentNullCheck()" class="btn btn-outline-dark">등록</button>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="card div-comment-box">
				<ul id="comment-box" class="list-group list-group-flush">
					<c:forEach var="comment" items="${board.comments}">
						<li id="comment-${comment.id}" class="list-group-item">
							<div class="font-italic">
								${comment.user.name} &nbsp;
								<fmt:formatDate value="${comment.createDate}" pattern="yyyy.MM.dd HH:mm:ss" />
							</div> <br />
							<div>${comment.content}</div>
							<c:if test="${comment.user.id == principal.user.id}">
								<form id="myCommentForm">
									<input type="hidden" id="myCommentId" value="${comment.id}" />
									<textarea rows="3" class="form-control" id="myCommentArea${comment.id}" hidden="true">${comment.content}</textarea>
								</form>
								<div class="div-btn" align="right">
									<p></p>
									<div>
										<button id="btn-close" onclick="closeCommentUpdate()" class="btn btn-outline-dark" hidden="true">취소</button>
										<button id="${comment.id}" onclick="showCommentUpdate(this)" class="btn btn-outline-dark">수정</button>
										<button onclick="commentDelete()" class="btn btn-outline-dark">삭제</button>
									</div>
								</div>
							</c:if>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>