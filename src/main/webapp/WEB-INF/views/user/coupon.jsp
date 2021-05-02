<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../layout/header.jsp"%>
	<div class="div-fullsize">
		<c:choose>
			<c:when test="${chk == 0}">
				<script>
					$(document).ready(function() {
						Swal.fire({
							icon : 'info',
							title: '쿠폰 발급 완료',
							text : '쿠폰 정보는 마이페이지에서 확인 가능합니다.',
							confirmButtonText : '확인'
						}).then(() => {
							location.href = "/";
						});
					});
				</script>
			</c:when>
			<c:otherwise>
				<script>
					$(document).ready(function() {
						Swal.fire({
							icon : 'warning',
							text : '이미 발급받은 쿠폰입니다.',
							confirmButtonText : '확인'
						}).then(() => {
							location.href = "/";
						});
					});
				</script>
			</c:otherwise>
		</c:choose>
	</div>
	<%@ include file="../layout/footer.jsp"%>
</div>