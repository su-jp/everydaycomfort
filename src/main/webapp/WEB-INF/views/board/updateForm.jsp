<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container div-write">
		<c:if test="${board.boardcode eq 'qna'}">
			<h3>질문과 답변</h3>
		</c:if>
		<c:if test="${board.boardcode eq 'inquiry'}">
			<h3>1:1 문의</h3>
		</c:if>
		<c:if test="${board.boardcode eq 'notice'}">
			<h3>공지사항</h3>
		</c:if>
		<c:if test="${board.boardcode eq 'counsel'}">
			<h3>리모델링 상담</h3>
		</c:if>
		<form>
			<input type="hidden" id="boardId" value="${board.id}" />
			<input type="hidden" id="userId" value="${principal.user.id}" />
			<input type="hidden" id="boardCode" value="${board.boardcode}"/>
			<div class="form-group">
				<input value="${board.title}" type="text" class="form-control" id="title" placeholder="제목">
			</div>
			<div class="form-group">
				<textarea class="form-control summernote" rows="5" id="content">${board.content}</textarea>
			</div>
		</form>
		<div class="div-btn">
			<p></p>
			<button type="button" onclick="boardUpdateNullCheck()" class="btn">수정하기</button>
		</div>
	</div>
	<script>
		$('.summernote').summernote({
			tabsize : 2,
			height : 500
		});
	</script>
</div>
<%@ include file="../layout/footer.jsp"%>
</div>