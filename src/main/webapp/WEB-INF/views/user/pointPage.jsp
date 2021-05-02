<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../layout/header.jsp"%>
	<div class="main-div">
		<div class="container div-pointpage">
			<div class="div-fullsize">
				<h3>포인트/쿠폰</h3>
				<h4>보유 포인트</h4>
				<h4>
					${user.point } 점 <br /> <font><br />포인트는 1점 이상부터 현금처럼 사용할 수 있습니다.</font><br />
				</h4>
				<hr />
				<h4>
					보유 쿠폰 <br />
				</h4>
				<c:if test="${empty user.coupons }">
					<font><br />보유하고 있는 쿠폰이 없습니다.</font>
					<br />
				</c:if>
				<div class="div-coupon">
					<c:forEach var="coupon" items="${user.coupons}">
						<c:if test="${coupon.validChk == 0}">
							<div class="card">
								<div class="card-body">
									<h5 id="productTitle" class="card-title">${coupon.couponName }</h5>
									<font><br />${coupon.minAmount }원 이상 구매시 최대 ${coupon.maxAmount }원 할인</font> <font><br />유효기간 : <fmt:formatDate value="${coupon.createDate}" pattern="yyyy년 M월 d일" />로부터
										${coupon.validity }일</font>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>
</div>