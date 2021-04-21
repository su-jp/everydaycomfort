<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../layout/header.jsp"%>
	<div class="main-div">
		<div class="container div-shop">
			<div class="row">
				<div class="dropdown col-sm-1">
					<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">카테고리</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" id="furniture" onclick="callList(this)">가구</a>
						<a class="dropdown-item" id="bedding" onclick="callList(this)">침구</a>
						<a class="dropdown-item" id="lighting" onclick="callList(this)">조명</a> 
						<a class="dropdown-item" id="homedeco" onclick="callList(this)">홈데코</a> 
						<a class="dropdown-item" id="appliance" onclick="callList(this)">가전</a> 
						<a class="dropdown-item" id="kitchen" onclick="callList(this)">주방</a> 
						<a class="dropdown-item" id="bath" onclick="callList(this)">욕실</a>
					</div>
				</div>
			</div>
			<div class="container-fluid div-items">
				<div class="row">
					<c:forEach var="product" items="${list.content}">
						<div class="col-sm-4">
							<form>
								<div class="card">
									<img class="card-img-top img-product" id="productImage" src="${product.image}" alt="item">
									<div class="card-body">
										<h5 id="productTitle" class="card-title">${product.title}</h5>
										<a href="/shop/detail/${product.title}" class="stretched-link">
											<fmt:formatNumber value="${product.lprice}" type="number" />원
										</a>
									</div>
								</div>
							</form>
						</div>
					</c:forEach>
				</div>
			</div>
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${list.first}">
						<li class="page-item disabled"><a class="page-link" href="?page=${list.number-1}"> ◀ </a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="?page=${list.number-1}"> ◀ </a></li>
					</c:otherwise>
				</c:choose>
				<li class="page-item"><a class="page-link" href="?page=${list.number}"> ${list.number+1} </a></li>
				<c:choose>
					<c:when test="${list.last}">
						<li class="page-item disabled"><a class="page-link" href="?page=${list.number+1}"> ▶ </a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="?page=${list.number+1}"> ▶ </a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>
</div>