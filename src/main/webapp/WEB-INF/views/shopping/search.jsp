<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../layout/header.jsp"%>
	<div class="main-div">
		<div class="container div-shop">
			<c:choose>
				<c:when test="${list == 'Page 1 of 1 containing UNKNOWN instances'}">
					<h3>검색 결과가 없습니다!</h3>
				</c:when>
				<c:otherwise>
					<div class="container-fluid div-items">
						<div class="row">
							<c:forEach var="product" items="${list.content}">
								<div class="col-sm-4">
									<form>
										<div class="card">
											<img class="card-img-top img-product" id="productImage" src="${product.image}" alt="item">
											<div class="card-body">
												<h5 id="productTitle" class="card-title">${product.title}</h5>
												<a href="/shop/detail/${product.title}" class="stretched-link">\ ${product.lprice}</a>
											</div>
										</div>
									</form>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>
</div>