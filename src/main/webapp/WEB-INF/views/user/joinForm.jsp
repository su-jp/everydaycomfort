<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container-sm div-join">
		<div class="div-form">
			<h3>회원가입</h3>
			<hr/>
			<form>
				<div class="form-group">
					<label for="email">아이디</label>
					<input type="email" class="form-control" placeholder="예) 이메일@ecomfort.com" id="email">
				</div>
				<div class="form-group">
					<label for="password">비밀번호<br/>
					<small>8자 이상 입력해주세요.</small>
					</label>
					<input type="password" class="form-control" placeholder="비밀번호" id="password">
				</div>
				<div class="form-group">
					<label for="password2">비밀번호</label>
					<input type="password" class="form-control" placeholder="비밀번호 확인" id="password2">
				</div>
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" class="form-control" placeholder="이름" id="name">
				</div>
				<div class="form-group">
					<label for="phonenum">전화번호</label>
					<input type="text" class="form-control" placeholder="전화번호" id="phonenum">
				</div>
				<div class="form-group">
					<label for="address">주소</label>
					<input type="text" class="form-control" placeholder="주소" id="address">
				</div>
				<button onclick="join()" class="btn">회원가입 완료</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>