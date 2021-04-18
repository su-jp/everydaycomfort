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
					<h2><fmt:formatNumber value="${product.lprice}" type="number"/>원
						<small>
							<span class="badge bg-danger text-light">특가</span>
						</small><br/>
					</h2>
					<h5><fmt:formatNumber value="${product.lprice * 0.9}" type="number"/>원
						<span>10% 할인 첫 구매 할인가</span>
					</h5>
					<h6><span>${product.lprice * 0.005}P</span> 적립 (0.5% 적립)</h6>
					<hr/>
					<div class="div-padding">
						<p>일반택배</p>
						<span class="badge bg-info text-light">무료배송</span><br/>
						<small>· 조건에 따라 추가비용 발생 가능 (상품 상세 정보 참고)<br/>
						· 제주도/도서산간 지역 배송 불가</small>
					</div>
					<hr/>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>