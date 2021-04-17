<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<nav class="nav-bar">
	<div>
		<a href="#home"><span>홈</span></a> 
		<a href="#category"><span>카테고리</span></a> 
		<a href="#interior"><span>인테리어</span></a> 
		<a href="#promotion"><span>기획전</span></a> 
		<a href="#qna"><span>질문과답변</span></a> 
		<span></span>
	</div>
</nav>
<div id="home" class="main-div">
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
		<div class="brand-ad">
			<a href="/board/brandstory">
				<img src="/images/banner.jpg" class="rounded mx-auto d-block" alt="banner">
			</a>
		</div>
		
		<%@ include file="main/category.jsp"%>
		<%@ include file="main/interior.jsp"%>
		<%@ include file="main/promotion.jsp"%>
		<%@ include file="main/qna.jsp"%>
	</div>
</div>
<%@ include file="layout/footer.jsp"%>