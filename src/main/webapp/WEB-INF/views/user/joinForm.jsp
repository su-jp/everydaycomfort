<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../layout/header.jsp"%>
	<div class="main-div">
		<div class="container-sm div-join">
			<div class="div-form">
				<h3>회원가입</h3>
				<hr />
				<div class="div-login-sub">
					<h6>SNS 계정으로 간편하게 로그인/회원가입하기</h6>
					<br /> <a href="/oauth2/authorization/kakao"><img width="180px" src="/images/icons/kakao_login_btn.png"></a> <a href="/oauth2/authorization/google"><img width="180px"
						src="/images/icons/google_login_btn.png"></a> <br />
					<br />
				</div>
				<hr />
				<form class="was-validated">
					<div class="form-group">
						<label for="email">이메일 아이디</label> <input type="email" class="form-control" placeholder="이메일" id="email" required>
					</div>
					<input type="hidden" value="1" id="validChk" />
				</form>
				<div class="div-btn">
					<p></p>
					<button class="btn btn-outline-dark" onclick="emailCheck()">중복확인</button>
				</div>
				<form class="was-validated">
					<div class="form-group">
						<label for="password">비밀번호 </label> <input type="password" class="form-control" placeholder="비밀번호" id="password" required>
					</div>
					<div class="form-group">
						<label for="passwordChk">비밀번호 확인<font id="chkNotice" size="2"></font></label> <input type="password" class="form-control" placeholder="비밀번호 확인" id="passwordChk" required>


					</div>
					<div class="form-group">
						<label for="name">이름</label> <input type="text" class="form-control" placeholder="이름" id="name" required>
					</div>
					<div class="form-group">
						<label for="phonenum">전화번호</label> <input type="number" class="form-control" placeholder="전화번호" id="phonenum" required>
					</div>
					<div class="form-group">
						<label for="address">주소</label> <input type="text" class="form-control" placeholder="주소" id="address" required>
					</div>
				</form>
				<button id="joinBtn" onclick="joinNullCheck()" class="btn">회원가입 완료</button>
			</div>
		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>
</div>