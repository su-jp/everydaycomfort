<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container-sm div-login">
		<div class="div-form">
			<h3>로그인</h3>
			<hr/>
			<form action="/loginProc" method="post">
				<div class="form-group">
					<label for="username">이메일</label>
					<input type="email" class="form-control" placeholder="이메일" name="username">
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label>
					<input type="password" class="form-control" placeholder="비밀번호" name="password">
				</div>
				<button type="submit" class="btn">로그인</button>
			</form>
			<div class="div-login-sub">
				<a href="#">비밀번호 재설정</a>
				<a href="/join">회원가입</a><br/>
				<br/><hr/><br/>
				<h6>SNS 계정으로 간편하게 로그인/회원가입하기</h6>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>