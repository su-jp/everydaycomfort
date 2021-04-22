<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../layout/header.jsp"%>
	<div class="main-div">
		<div class="container-sm div-mypage">
			<br />
			<br />
			<h1>마이페이지</h1>
			<br />
			<br />
			<a href="/user/myinfo" class="btn btn-outline-dark">개인정보수정</a>
			<a href="/user/orderlist" class="btn btn-outline-dark">주문내역조회</a>
			<a href="/board/inquiry" class="btn btn-outline-dark">1:1 문의</a>
		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>
</div>