<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
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
			<a href="#">
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