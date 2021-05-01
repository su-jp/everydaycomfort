<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../../layout/header.jsp"%>
	<div class="main-div">
		<div class="container div-orderdetail">
			<div class="div-fullsize">
				<h3>주문 상세내역</h3>
				<p>주문번호 : ${order.orderNum}</p>
				<div class="container-fluid">
				<hr />
					<c:forEach var="detail" items="${details}">
						<div class="row">
							<div class="col-sm-2">
								<img class="image-orderdetail" alt="productImage" src="${detail.productImage}">
							</div>
							<div class="col-sm-7">
								<p>${detail.productTitle}</p>
							</div>
							<div class="col-sm-1 div-right">
								<p>${detail.productQuantity}개</p>
							</div>
							<div class="col-sm-2 div-right div-padding">
								<p>
									<fmt:formatNumber value="${detail.productPrice}" type="number" />
									원
								</p>
							</div>
						</div>
					</c:forEach>
					<hr />
				</div>
				<div class="div-right div-padding">
					<c:if test="${order.usedCoupon != 0}">
						<p>쿠폰할인 : - <fmt:formatNumber value="${order.usedCoupon}" type="number" />
						원</p>
					</c:if>
					<c:if test="${order.usedPoint != 0}">
						<p>적립금할인 : - <fmt:formatNumber value="${order.usedPoint}" type="number" />
						원</p>
					</c:if>
					<p>
						결제금액 :
						<fmt:formatNumber value="${order.totalAmount}" type="number" />
						원
					</p>
					<p>
						주문일자 :
						<fmt:formatDate value="${order.payDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss" />
					</p>
					<p>주문상태 : ${order.orderStatus}</p>
					<c:if test="${order.orderStatus == '결제대기중'}">
						<p>무통장입금 : ${order.payInfo }</p>
					</c:if>
					<c:if test="${order.orderStatus == '결제완료' || order.orderStatus == '결제대기중'}">
						<a class="btn btn-outline-dark" onclick="cancelOrder(${order.id})">주문취소</a>
					</c:if>
					<c:if test="${!empty order.deliveryInfo}">
						<p>배송정보 : ${order.deliveryInfo}</p>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</div>