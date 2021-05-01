<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../../layout/header.jsp"%>
	<div class="main-div">
		<div class="container">
			<div class="div-fullsize div-orderSuccess">
				<h3>주문 완료</h3>
				<p>
					주문이 완료되었습니다.<br />
					주문번호 ${orderNum}<br /><br />
					자세한 사항은 주문내역을 통해 확인할 수 있습니다.
				</p>
				<a class="btn btn-outline-dark" href="/user/orderlist">주문내역 확인하기</a>
				<p>
					감사합니다.<br/><br/>
					고객센터 : 1677-0000
				</p>
			</div>
		</div>
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</div>
<c:if test="${empty orderNum}">
	<script>
		$(document).ready(function() {
			Swal.fire({
				icon: 'warning',
				text: '잘못된 접근입니다.',
			}).then(() => {
				location.href = "/";
			});
		});
	</script>
</c:if>