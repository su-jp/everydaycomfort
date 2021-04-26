<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../layout/header.jsp"%>
	<div class="div-fullsize">
		<script>	
			$(document).ready(function() {
				Swal.fire({
					icon: 'error',
					title: '로그인에 실패하였습니다.',
					text: '아이디와 비밀번호를 확인해주세요.',
				}).then(() => {
					location.href = "/loginForm";
				});
			});
		</script>
	</div>
	<%@ include file="../layout/footer.jsp"%>
</div>