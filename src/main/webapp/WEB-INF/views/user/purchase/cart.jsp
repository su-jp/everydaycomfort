<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../../layout/header.jsp"%>
	<div class="main-div">
		<div class="container div-cart">
			<div class="div-fullsize">
				<h3>장바구니</h3>
				<c:choose>
					<c:when test="${empty carts}">
						<h4>장바구니가 비어있어요 😥<br/><br/>인테리어를 즐기러 가볼까요?</h4>
						<div class="div-btn-center">
							<a href="/shop" class="btn btn-outline-dark btn-large">상품 담으러 가기</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="div-btn">
							<p></p>
							<button class="btn btn-outline-dark" onclick="deleteAllItems()">전체삭제</button>
						</div>
						<div class="container-fluid div-cartItem">
							<c:set var="totalAmount" value="0" />
							<c:forEach var="cart" items="${carts}">
								<hr />
								<div class="row">
									<div class="col-sm-4">
										<img class="image-cartItem" alt="itemImage" src="${cart.productImage}">
									</div>
									<div class="col-sm-5">
										<p>${cart.productTitle}</p>
										<p>
											<fmt:formatNumber value="${cart.productPrice}" type="number" />원
										</p>
										<p>
											<button class="btn btn-outline-light text-dark" onclick="itemQuantity(${cart.id}, -1, ${cart.productQuantity})">＜</button>
											${cart.productQuantity}
											<button class="btn btn-outline-light text-dark" onclick="itemQuantity(${cart.id}, +1, ${cart.productQuantity})">＞</button>
										</p>
										<c:set var="eachAmount" value="${cart.productPrice * cart.productQuantity}" />
										<c:set var="totalAmount" value="${totalAmount + eachAmount}" />
									</div>
									<div class="col-sm-3 div-item-right">
										<div class="div-deleteBtn">
										<button class="btn btn-outline-light text-dark" onclick="deleteSelectedItem(${cart.id})">X</button>
										</div>
										<div class="p-itemPrice">
											<fmt:formatNumber value="${eachAmount}" type="number" />원
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<hr/>
						<div class="div-amount">
							<h6>
								총 상품금액&nbsp;
								<fmt:formatNumber value="${totalAmount}" type="number" />원
							</h6>
							<h6>
								<c:set var="discountAmount" value="${totalAmount * 0.1}" />
								총 할인금액&nbsp;  -
								<fmt:formatNumber value="${discountAmount}" type="number" />원
							</h6>
							<h5>
								결제금액&nbsp;
								<c:set var="finalAmount" value="${totalAmount - discountAmount}" />
								<fmt:formatNumber value="${finalAmount}" type="number" />원
							</h5>
						</div>
							<div class="div-btn">
							<p></p>
							<button class="btn btn-outline-dark btn-large">구매하기</button>
							</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</div>