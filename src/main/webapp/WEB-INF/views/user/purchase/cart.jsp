<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<div id="bodyContents">
	<div class="main-div">
		<div class="container">
			<h1>장바구니 페이지</h1>
			<button onclick="">전체삭제</button>
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
			금액 : <c:out value="${eachAmount}" />
				<c:set var="totalAmount" value="${totalAmount + eachAmount}" />
			</c:forEach>
			<h3>
				결제금액 :
				<c:out value="${totalAmount}" />
			</h3>
		</div>
	</div>
</div>
<%@ include file="../../layout/footer.jsp"%>