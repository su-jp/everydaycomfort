<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="main-div">
	<div class="container div-category">
		<h3>쇼핑</h3>
		<h4>카테고리</h4>
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
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>