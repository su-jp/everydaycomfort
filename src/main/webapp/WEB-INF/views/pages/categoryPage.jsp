<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bodyContents">
	<%@ include file="../layout/header.jsp"%>
	<div class="main-div">
		<div class="container div-category">
			<h3>쇼핑</h3>
			<h4>전체 카테고리</h4>
			<div class="inner-div">
				<nav class="category-shortcut">
					<ul class="row shortcut-list">
						<li class="shortcut-list-item"><a id="furniture" class="shortcut-list-item-link" onclick="callList(this)">
								<div>
									<img alt="shortcut1" src="/images/icons/icon1.png" />
								</div>
								<div>가구</div>
						</a></li>
						<li class="shortcut-list-item"><a id="bedding" class="shortcut-list-item-link" onclick="callList(this)">
								<div>
									<img alt="shortcut2" src="/images/icons/icon2.png" />
								</div>
								<div>침구</div>
						</a></li>
						<li class="shortcut-list-item"><a id="lighting" class="shortcut-list-item-link" onclick="callList(this)">
								<div>
									<img alt="shortcut3" src="/images/icons/icon3.png" />
								</div>
								<div>조명</div>
						</a></li>
						<li class="shortcut-list-item"><a id="homedeco" class="shortcut-list-item-link" onclick="callList(this)">
								<div>
									<img alt="shortcut4" src="/images/icons/icon4.png" />
								</div>
								<div>홈데코</div>
						</a></li>
						<li class="shortcut-list-item"><a id="appliance" class="shortcut-list-item-link" onclick="callList(this)">
								<div>
									<img alt="shortcut5" src="/images/icons/icon5.png" />
								</div>
								<div>가전</div>
						</a></li>
						<li class="shortcut-list-item"><a id="kitchen" class="shortcut-list-item-link" onclick="callList(this)">
								<div>
									<img alt="shortcut6" src="/images/icons/icon6.png" />
								</div>
								<div>주방</div>
						</a></li>
						<li class="shortcut-list-item"><a id="bath" class="shortcut-list-item-link" onclick="callList(this)">
								<div>
									<img alt="shortcut7" src="/images/icons/icon7.png" />
								</div>
								<div>욕실</div>
						</a></li>
					</ul>
				</nav>
			</div>
			<div id="demo" class="carousel slide" data-ride="carousel" data-interval="2500">
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
					<li data-target="#demo" data-slide-to="3"></li>
				</ul>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/images/promotion1.jpg" alt="promo1" onclick="location.href='/promotion/kitchen'">
					</div>
					<div class="carousel-item">
						<img src="/images/promotion2.jpg" alt="promo2" onclick="location.href='/promotion/doolsam'">
					</div>
					<div class="carousel-item">
						<img src="/images/promotion3.jpg" alt="promo3" onclick="location.href='/promotion/desk'">
					</div>
					<div class="carousel-item">
						<img src="/images/promotion4.jpg" alt="promo4" onclick="location.href='/promotion/plant'">
					</div>
				</div>
				<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next"> <span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>
</div>