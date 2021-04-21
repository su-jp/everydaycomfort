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
							<p>상품가격 : ${cart.productPrice}</p>
							<p>${cart.productQuantity}개</p>
							<img alt="itemImage" src="${cart.productImage}" width="300px">
							<button onclick="deleteSelectedItem(${cart.id})">X</button>
							<br />
							<c:set var="eachAmount" value="${cart.productPrice * cart.productQuantity}" />
							<p>금액 : <c:out value="${eachAmount}" /></p>
							<c:set var="totalAmount" value="${totalAmount + eachAmount}" />
						</c:forEach>
						<h3>
							결제금액 :
							<c:out value="${totalAmount}" />
						</h3>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</div>