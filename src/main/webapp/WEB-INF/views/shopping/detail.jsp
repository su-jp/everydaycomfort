<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container div-itemdetail">
		<div>
			<button class="btn btn-outline-light text-dark" onclick="history.back()">＜＜ 목록으로</button>
		</div>
		<div class="container-fluid div-detail">
			<div class="row">
				<div class="col-sm-6">
					<img class="rounded" alt="product" src="${product.image}">
				</div>
				<div class="col-sm-6">
					<h3>${product.title}</h3>
					<h2>
						<fmt:formatNumber value="${product.lprice}" type="number" />
						원 <small> <span class="badge bg-danger text-light">특가</span>
						</small><br />
					</h2>
					<h5>
						<fmt:formatNumber value="${product.lprice * 0.9}" type="number" />
						원 <span>10% 할인적용 이벤트 할인가</span>
					</h5>
					<h6>
						<span> <fmt:formatNumber value="${product.lprice * 0.005}" pattern="0" />P
						</span> 적립 (0.5% 적립)
					</h6>
					<hr />
					<div class="div-padding">
						<p>일반택배</p>
						<span class="badge bg-info text-light">무료배송</span><br />
						<small>· 조건에 따라 추가비용 발생 가능 (상품 상세 정보 참고)<br /> · 제주도/도서산간 지역 배송 불가</small>
					</div>
					<hr />
					<form action="" class="quantity-form">
						<select name="quantity" class="custom-select">
							<option selected>수량선택</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
						<c:choose>
							<c:when test="${empty principal}">
								<button type="button" class="btn1" onclick="loginAlert()">장바구니</button>
								<button type="button" class="btn2" onclick="loginAlert()">바로구매</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn1">장바구니</button>
								<button type="button" class="btn2">바로구매</button>
							</c:otherwise>
						</c:choose>
					</form>
					<div class=""></div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>