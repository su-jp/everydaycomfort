<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container div-write">
		<c:if test="${boardCode eq 'qna'}">
			<h3>질문과 답변</h3>
		</c:if>
		<form>
			<input type="hidden" id="userId" value="${principal.user.id}" />
			<input type="hidden" id="boardCode" value="qna"/>
			<div class="form-group">
				<input type="text" class="form-control" id="title" placeholder="제목">
			</div>
			<div class="form-group">
				<textarea class="form-control summernote" rows="5" id="content"></textarea>
			</div>
		</form>
		<button type="button" onclick="nullCheck()" class="btn btn-outline-info">🍈 작성하기</button>
	</div>
	<script>
		$('.summernote').summernote({
			tabsize : 2,
			height : 500
		});
	</script>
</div>
<%@ include file="../layout/footer.jsp"%>