<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../../layout/header.jsp"%>
	<div class="main-div">
		<div class="container">
			<div class="div-fullsize">
				<h1>장바구니</h1>
				<c:choose>
					<c:when test="${empty carts}">
						<h3>장바구니가 비어있어요~</h3>
						<a href="/shop" class="btn btn-outline-dark">상품 담으러 가기</a>
					</c:when>
					<c:otherwise>
						<button onclick="deleteAllItems()">전체삭제</button>
						<c:set var="totalAmount" value="0" />

						<c:forEach var="cart" items="${carts}">
							<hr />
							<p>${cart.productTitle}</p>
							<p>상품가격 <fmt:formatNumber value="${cart.productPrice}" type="number" />원 </p>
							<p>
								<button onclick="itemQuantity(${cart.id}, -1, ${cart.productQuantity})">＜</button>
								<font id="${cart.id}">${cart.productQuantity}</font>개
								<button onclick="itemQuantity(${cart.id}, +1, ${cart.productQuantity})">＞</button>
							</p>
							<img alt="itemImage" src="${cart.productImage}" width="300px">
							<button onclick="deleteSelectedItem(${cart.id})">X</button>
							<br />
							<c:set var="eachAmount" value="${cart.productPrice * cart.productQuantity}" />
							<p>금액 <fmt:formatNumber value="${eachAmount}" type="number" />원</p>
							<c:set var="totalAmount" value="${totalAmount + eachAmount}" />
						</c:forEach>
						<h3>
							총 상품금액 <fmt:formatNumber value="${totalAmount}" type="number" />원<br />
							총 할인금액 <c:set var="discountAmount" value="${totalAmount * 0.1}" />
							<fmt:formatNumber value="${discountAmount}" type="number" />원<br />
							결제금액 <c:set var="finalAmount" value="${totalAmount - discountAmount}" />
							<fmt:formatNumber value="${finalAmount}" type="number" />원
						</h3>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</div>