<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container div-write">
		<c:if test="${boardCode eq 'qna'}">
			<h3>질문과 답변</h3>
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
		<form>
			<input type="hidden" id="userId" value="${principal.user.id}" />
			<input type="hidden" id="boardCode" value="${boardCode}"/>
			<div class="form-group">
				<input type="text" class="form-control" id="title" placeholder="제목">
			</div>
			<div class="form-group">
				<textarea class="form-control summernote" rows="5" id="content"></textarea>
			</div>
		</form>
		<div class="div-btn">
			<p></p>
			<button type="button" onclick="boardNullCheck()" class="btn">등록하기</button>
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