<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>🏡 편안한 가</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" type="text/css" href="/css/jquery.fullPage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/js/jquery.fullPage.js"></script>
</head>
<body>
	<div class="main-div-fullpage">
		<header class="header-fullpage">
			<nav>
				<ul>
					<li><a href="/">X</a></li>
				</ul>
			</nav>
		</header>
		<div class="container">
			<main id="fullpage">
				<section class="section">
					<div class="section3">
						<img src="/images/interior1.jpg" class="img-fluid img-fullpage" />
						<div class="text-fullpage">
							<h2>편안한가에서 인증받은 리모델링 업체와 <span>무료</span>로 상담해보세요.</h2>
							<h5>
							가능지역 : 서울/경기/인천/대구/충청/대전<br/>
							광주/전라/울산/부산/창원
							</h5>
						</div>
					</div>
				</section>
				<section class="section">
					<div class="section2">
						<img src="/images/interior2.jpg" class="img-fluid img-fullpage" />
						<div class="text-fullpage">
							<h2>
								<br/><br/><br/>2,000개 이상의 리뷰가 증명합니다.<br/><br/>
							</h2>
							<a href="#">바로 상담 신청하기</a>
						</div>
					</div>
				</section>
			</main>
		</div>
	</div>
	<script src="/js/main.js"></script>
</body>
</html>