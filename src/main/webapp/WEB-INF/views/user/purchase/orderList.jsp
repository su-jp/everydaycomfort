<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../../layout/header.jsp"%>
	<div class="main-div">
		<div class="container div-orderlist">
			<div class="div-fullsize">
				<h3>주문내역조회</h3>
				<c:choose>
					<c:when test="${empty orders}">
						<h4>
							주문 내역이 없어요 😥<br /> <br />인테리어를 즐기러 가볼까요?
						</h4>
						<div class="div-btn-center">
							<a href="/shop" class="btn btn-outline-dark btn-large">상품 담으러 가기</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="container-fluid">
							<hr />
							<c:forEach var="order" items="${orders}">
								<div class="row">
									<div class="col-sm-7 div-orderlist-col-left">
										<p>주문번호 : ${order.orderNum}</p>
										<p>
											결제금액 :
											<fmt:formatNumber value="${order.totalAmount}" type="number" />
											원
										</p>
										<p>
											주문일자 :
											<fmt:formatDate value="${order.payDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss" />
										</p>
									</div>
									<div class="col-sm-2 div-orderlist-col-center">
										<p>${order.orderStatus}</p>
									</div>
									<div class="col-sm-2 div-orderlist-col-right">
										<a href="/user/orderlist/${order.id}" class="btn btn-outline-light text-dark">상세보기</a>
									</div>
								</div>
								<hr />
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</div>