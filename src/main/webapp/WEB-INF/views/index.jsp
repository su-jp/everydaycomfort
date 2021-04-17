<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<div class="main-div">
	<div class="container">
		<div id="pop" class="popup">
			<table>
				<tbody>
					<tr>
						<td style="border: none; margin-bottom: auto;">
						<img src="/images/popup.jpg" style="width: 350px"></td>
					</tr>
					<tr style="float: right;">
						<td>24시간동안 보지 않기 <input type="checkbox" id="popupCheckbox"></td>
						<td><input type="button" value="닫기" onclick="closePop();"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="ad" class="interior">
			<div class="carousel slide" data-ride="carousel">
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/images/ad1.jpg" alt="Los Angeles" width="1100" height="550">
						<div class="carousel-caption">
							<h2>Los Angeles</h2>
							<p>We had such a great time in LA!</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="/images/ad2.jpg" alt="Chicago" width="1100" height="550">
						<div class="carousel-caption">
							<h2>Chicago</h2>
							<p>Thank you, Chicago!</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="/images/ad3.jpg" alt="New York" width="1100" height="550">
						<div class="carousel-caption">
							<h2>New York</h2>
							<p>We love the Big Apple!</p>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next"> <span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
		<div id="category">
			<nav class="category-shortcut">
				<ul class="row shortcut-list">
					<li class="shortcut-list-item">
						<a class="shortcut-list-item-link">
							<div><img alt="" src="/images/icons/icon01_closet.png"/></div>
							<div>가구</div>
						</a>
					</li>
					<li class="shortcut-list-item">
						<a class="shortcut-list-item-link">
							<div><img alt="" src="/images/icons/icon01_closet.png"/></div>
							<div>침구</div>
						</a>
					</li>
					<li class="shortcut-list-item">
						<a class="shortcut-list-item-link">
							<div><img alt="" src="/images/icons/icon01_closet.png"/></div>
							<div>패브릭</div>
						</a>
					</li>
					<li class="shortcut-list-item">
						<a class="shortcut-list-item-link">
							<div><img alt="" src="/images/icons/icon01_closet.png"/></div>
							<div>조명</div>
						</a>
					</li>
					<li class="shortcut-list-item">
						<a class="shortcut-list-item-link">
							<div><img alt="" src="/images/icons/icon01_closet.png"/></div>
							<div>홈데코</div>
						</a>
					</li>
					<li class="shortcut-list-item">
						<a class="shortcut-list-item-link">
							<div><img alt="" src="/images/icons/icon01_closet.png"/></div>
							<div>가전</div>
						</a>
					</li>
					<li class="shortcut-list-item">
						<a class="shortcut-list-item-link">
							<div><img alt="" src="/images/icons/icon01_closet.png"/></div>
							<div>주방</div>
						</a>
					</li>
				</ul>
			</nav>
		</div>
		<div id="interior">
			<div>
				<a href="/board/interior">인테리어 시공 상담</a>
			</div>
		</div>
		<div id="promotion">
			<div>
				<h3>프로모션 소개</h3>
			</div>
		</div>
		
		<div id="qna">
			<div>
				<h3>질문과 답변</h3>
				<h4>편안한가의 인테리어 전문가에게 조언을 받아보세요.</h4>
			</div>
		</div>
		<div id="event">
			<div>
				<h3>이벤트 소개 페이지</h3>
				<div>
					사진 올리면 5만 포인트를! (SNS 이벤트)<br/>
					최대 100만 포인트 행운 (출석 이벤트)<br/>
					이번에는 내가 주인공? (리모델링 이벤트)<br/>
					댓글만 달아도 포인트를? (기획전 댓글 이벤트)<br/>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="layout/footer.jsp"%>