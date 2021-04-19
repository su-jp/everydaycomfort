<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container-sm div-login">
		<div class="div-form">
			<h3>로그인</h3>
			<hr/>
			<form action="/loginProc" method="post" class="was-validated">
				<div class="form-group">
					<label for="username">이메일</label> <input type="text" class="form-control" placeholder="이메일" name="username" id="username" required>
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label> <input type="password" class="form-control" placeholder="비밀번호" name="password" id="password" required>
				</div>
				<button type="submit" class="btn">로그인</button>
			</form>
			<div class="div-login-sub">
				<a href="#">비밀번호 재설정</a>
				<a href="/join">회원가입</a><br/>
				<br/><hr/><br/>
				<h6>SNS 계정으로 간편하게 로그인/회원가입하기</h6><br/>
				<a href="/oauth2/authorization/kakao"><img width="180px" src="/images/icons/kakao_login_btn.png"></a>
				<a href="/oauth2/authorization/google"><img width="180px" src="/images/icons/google_login_btn.png"></a>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>