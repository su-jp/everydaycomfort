<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="qna" class="qna">
	<h3>질문과 답변</h3>
	<a href="/qna" class="small-link">>> 게시판 바로가기</a>
	<div class="">
		<hr />
		<c:forEach var="board" items="${boards.content}">
			<div class="div-boardlist">
				<a href="/board/${board.id}">${board.title}</a>
				<hr />
			</div>
		</c:forEach>
	</div>
</div>
</html>