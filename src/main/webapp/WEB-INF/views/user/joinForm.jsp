<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container-sm div-join">
		<div class="div-form">
			<h3>회원가입</h3>
			<hr/>
			<form class="was-validated">
				<div class="form-group">
					<label for="email">아이디</label>
					<input type="email" class="form-control" placeholder="예) 이메일@ecomfort.com" id="email" required>
				</div>
				<div class="form-group">
					<label for="password">비밀번호
					</label>
					<input type="password" class="form-control" placeholder="비밀번호" id="password" required>
				</div>
				<div class="form-group">
					<label for="password2">비밀번호 확인</label>
					<input type="password" class="form-control" placeholder="비밀번호 확인" id="passwordChk" required>
					<font id="chkNotice" size="2"></font>
				</div>
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" class="form-control" placeholder="이름" id="name" required>
				</div>
				<div class="form-group">
					<label for="phonenum">전화번호</label>
					<input type="text" class="form-control" placeholder="전화번호" id="phonenum" required>
				</div>
				<div class="form-group">
					<label for="address">주소</label>
					<input type="text" class="form-control" placeholder="주소" id="address" required>
				</div>
				<button id="joinBtn" onclick="joinNullCheck()" class="btn">회원가입 완료</button>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
    $('#password').keyup(function(){
      $('#chkNotice').html('');
    });

    $('#passwordChk').keyup(function(){

        if($('#password').val() != $('#passwordChk').val()){
          $('#chkNotice').html('비밀번호가 일치하지 않습니다.');
          $('#chkNotice').attr('color', '#f82a2aa3');
          const target = document.getElementById("joinBtn");
          target.disabled = true;
        } else{
          $('#chkNotice').html('비밀번호가 일치합니다.');
          $('#chkNotice').attr('color', '#199894b3');
          const target = document.getElementById('joinBtn');
          target.disabled = false;
        }

    });
});
</script>
<%@ include file="../layout/footer.jsp"%>