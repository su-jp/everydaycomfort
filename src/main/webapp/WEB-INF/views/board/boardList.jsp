<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container div-board div-fullsize">
		<c:if test="${boardCode eq 'qna'}">
			<h3>질문과 답변</h3>
		</c:if>
		<c:if test="${boardCode eq 'notice'}">
			<h3>공지사항</h3>
		</c:if>
		<c:if test="${boardCode eq 'counsel'}">
			<h3>리모델링 상담</h3>
		</c:if>
		<c:if test="${boardCode eq 'inquiry'}">
			<h3>1:1 문의</h3>
			<c:if test="${empty principal}">
				<script type="text/javascript">
					$(function() {
						loginRequired();
					});
				</script>
			</c:if>
		</c:if>
		<hr />
		<c:choose>
			<c:when test="${boardCode eq 'inquiry'}">
					<c:forEach var="board" items="${boards.content}">
						<c:if test="${board.user.email eq principal.user.email}">
							<div class="div-boardlist">
								<span> <a href="/board/${board.id}">${board.title}</a>
								</span> <span> <font>${board.user.name}</font>&nbsp;&nbsp;&nbsp; <font><fmt:formatDate value="${board.createDate}" pattern="yyyy.MM.dd" /></font>&nbsp;&nbsp;&nbsp; <font class="font-count">${board.count}</font>&nbsp;&nbsp;&nbsp;
								</span>
							</div>
							<hr />
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="board" items="${boards.content}">
						<div class="div-boardlist">
							<span> <a href="/board/${board.id}">${board.title}</a>
							</span> <span> <font>${board.user.name}</font>&nbsp;&nbsp;&nbsp; <font><fmt:formatDate value="${board.createDate}" pattern="yyyy.MM.dd" /></font>&nbsp;&nbsp;&nbsp; <font class="font-count">${board.count}</font>&nbsp;&nbsp;&nbsp;
							</span>
						</div>
						<hr />
					</c:forEach>
				</c:otherwise>
			</c:choose>
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
				<form action="<c:url value='/board/search/${boardCode}' />" method="get" onsubmit="return boardSearchNullCheck()">
					<div class="row div-search">
						<div class="col-sm-5 div-sort">
							<select id="sort" name="sort" class="custom-select">
								<option selected>분류</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
						</div>
						<div class="col-sm-5 div-search-box">
							<input class="search-box" name="boardKeyword" id="boardKeyword" type="text" />
						</div>
						<div class="col-sm-2">
							<button type="submit" class="btn btn-outline-dark btn-search">검색</button>
						</div>
					</div>
				</form>
				<c:if test="${boardCode ne 'notice'}">
					<a class="btn" href="/user/board/${boardCode}">질문하기</a>
				</c:if>
				<c:if test="${boardCode eq 'notice' && principal.user.role eq 'ROLE_ADMIN'}">
					<a class="btn" href="/admin/board/notice">공지 작성하기</a>
				</c:if>
			</div>
		</div>
</div>
<%@ include file="../layout/footer.jsp"%>
</div>