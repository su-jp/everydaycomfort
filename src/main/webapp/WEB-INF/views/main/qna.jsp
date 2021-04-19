<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="qna" class="qna">
	<h3>질문과 답변</h3>
	<a href="/qna" class="small-link">>> 게시판 바로가기</a>
	<div class="container-fluid div-mainqna">
		<div class="row">
			<div class="col-sm-4">
				<h4>[ 다른 분들은 이런 질문을 했어요 ]</h4>
				<hr/>
				<c:forEach var="board" items="${boards.content}">
					<div class="div-boardlist">
						<a href="/board/${board.id}">${board.title}</a>
						<hr />
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-8">
				<img class="rounded mx-auto d-block qnaAd" alt="qnaAd" src="/images/qnaAd.jpg">
			</div>
		</div>
	</div>
</div>
</html>