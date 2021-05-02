<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../../layout/header.jsp"%>
	<div class="main-div">
		<div class="container div-order div-fullsize">
			<h3>주문/결제</h3>
			<h5>배송정보</h5>
			<hr />
			<div class="div-btn">
				<p></p>
				<form class="was-validated">
					<div class="form-group">
						<label for="name">받는 사람</label> <input type="text" class="form-control" placeholder="" id="name" value="${principal.user.name}" required>
					</div>
					<div class="form-group">
						<label for="phonenum">전화번호</label> <input type="number" class="form-control" placeholder="전화번호" id="phonenum" value="${principal.user.phonenum}" required>
					</div>
					<div class="form-group">
						<label for="address">주소</label> <input type="text" class="form-control" placeholder="주소" id="address" value="${principal.user.address}" required>
					</div>
				</form>
				<p></p>
			</div>

			<h5>주문상품</h5>
			<hr />
			<c:set var="totalAmount" value="0" />
			<c:forEach var="cart" items="${carts}">
				<c:if test="${!empty chkDirect }">
					<input type="hidden" id="cartId" value="${cart.id }" />
				</c:if>
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-2">
						<img class="image-cartItem" alt="itemImage" src="${cart.productImage}">
					</div>
					<div class="col-sm-6">
						<p>${cart.productTitle}</p>
						<fmt:formatNumber value="${cart.productPrice}" type="number" />
						원 &nbsp;X&nbsp; ${cart.productQuantity}개
						<c:set var="eachAmount" value="${cart.productPrice * cart.productQuantity}" />
						<c:set var="totalAmount" value="${totalAmount + eachAmount}" />
					</div>
					<div class="col-sm-1"></div>
					<div class="col-sm-2 div-item-right">
						<div class="p-itemPrice">
							<fmt:formatNumber value="${eachAmount}" type="number" />
							원
						</div>
					</div>
				</div>
				<hr />
			</c:forEach>
			<c:set var="discountAmount" value="${totalAmount * 0.1}" />
			<c:set var="pointDiscount" value="10000"/>
			<c:set var="discountAmount" value="${discountAmount}" />
			<c:set var="finalAmount" value="${totalAmount - discountAmount}" />
			<h5>결제수단</h5>
			<hr />
			<div class="row">
				<p class="col-sm-1"></p>
				<p class="col-sm-2.5 p-point">
				적립금 사용
				</p>
				<input id="totPoint" type="hidden" value="${principal.user.point}"/>
				<input id="point" value="${principal.user.point}" type="number" class="form-control form-point col-sm-1.5" />
				<form class="coupon-form col-sm-2">
					<select id="coupon" name="coupon" class="custom-select">
						<option selected>쿠폰선택</option>
						<c:forEach var="coupon" items="${coupons}" varStatus="idx">
							<c:if test="${coupon.minAmount <= finalAmount }">
								<option id="${idx.count - 1}" value="${coupon.id}"> ${coupon.couponName}</option>
							</c:if>
						</c:forEach>
					</select>
				</form>
				<form class="payment-form col-sm-2">
					<select id="payment" name="payment" class="custom-select">
						<option selected>결제수단선택</option>
						<option value="1">카드결제</option>
						<option value="2">무통장입금</option>
					</select>
				</form>
				<p></p>
				<div class="col-sm-4">
					<div class="div-amount">
						<h6>
							총 상품금액&nbsp;
							<fmt:formatNumber value="${totalAmount}" type="number" />
							원
						</h6>
						<h6>
							총 할인금액&nbsp; -
							<fmt:formatNumber value="${discountAmount}" type="number" />
							원
						</h6>
						<h6>
							적립금 사용 - 
							<font id="usedPoint">${principal.user.point}</font>
							원
						</h6>
						<h5>
							결제금액&nbsp;
							<font id="totAmount">${finalAmount}</font>
							원
						</h5>
					</div>
					<div class="div-btn">
						<p></p>
						<button class="btn btn-ouline-dark btn-large" onclick="paymentChk()">
							결제하기
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</div>
<c:if test="${empty carts}">
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