<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../layout/header.jsp"%>
	<div class="main-div">
		<div class="container-sm div-mypage div-fullsize">
			<h3>마이페이지</h3>
			<div class="div-quarter">
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-4">
						<a href="/user/myinfo" class="btn-mypage">
							회원정보
							<font><br/><br/>Email을 비롯한 정보를 확인하고<br/>전화번호, 주소를 수정할 수 있습니다.</font>
						</a>
					</div>
					<div class="col-sm-4">
						<a href="/board/inquiry" class="btn-mypage">
							1:1 문의
							<font><br/><br/>불편사항 등을 문의를 하거나<br/>제휴/광고문의를 할 수 있습니다.</font>
						</a>
					</div>
					<div class="col-sm-2"></div>
				</div>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-4">
						<a href="/user/orderlist" class="btn-mypage">
							주문내역
							<font><br/><br/>지난 구매내역을 비롯하여<br/>주문/배송현황을 확인할 수 있습니다.</font>
						</a>
					</div>
					<div class="col-sm-4">
						<a href="#" class="btn-mypage">
							쿠폰/적립금
							<font><br/><br/>쿠폰 및 적립금의 보유현황과<br/>사용내역을 확인할 수 있습니다.</font>
						</a>
					</div>
					<div class="col-sm-2"></div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>
</div>