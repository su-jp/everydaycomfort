<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../layout/header.jsp"%>
	<div class="main-div">
		<div class="container div-myinfo">
			<div class="div-form">
				<h3>회원정보수정</h3>
				<hr />
				<form class="was-validated">
					<input type="hidden" id="userId" value="${principal.user.id}"/>
					<div class="form-group">
						<label for="email">이메일 아이디</label> <input type="email" class="form-control" placeholder="이메일" id="email" value="${user.email}" readonly>
					</div>
					<div class="form-group">
						<label for="name">이름</label><font size="2">&nbsp;&nbsp;&nbsp;이름 변경이 필요한 경우 1:1 문의를 이용해주세요.</font> <input type="text" class="form-control" placeholder="이름" id="name" value="${user.name}" readonly>
					</div>
					<div class="form-group">
						<label for="phonenum">전화번호</label> <input type="number" class="form-control" placeholder="전화번호" id="phonenum" value="${user.phonenum}" required>
					</div>
					<div class="form-group">
						<label for="address">주소</label> <input type="text" class="form-control" placeholder="주소" id="address" value="${user.address}" required>
					</div>
				</form>
				<button onclick="profileUpdate()" class="btn btn-outline-dark">수정하기</button>
			</div>
		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>
</div>