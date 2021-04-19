<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>편안한가 | 원스톱 인테리어 플랫폼</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="header-div">
		<div>
			<a href="/"><img class="logo" alt="logo" src="/images/logo.png"></a>
			<form class="form-inline" action="<c:url value='/search' />" method="get">
				<input name="keyword" class="form-control" type="text" placeholder="편안한가 쇼핑 검색">
				<button class="btn btn-outline-light text-dark" type="submit">검색</button>
			</form>
			<a href="/login">로그인</a>
			<a href="/join">회원가입</a>
		</div>
	</div>
	<div class="sub-header">
		<div>
			<a href="/shop">쇼핑</a>
			<a href="/counsel">리모델링상담</a>
			<a href="/notice">공지사항</a>
			<a href="/qna">질문과답변</a>
		</div>
	</div>