<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>🏡 편안한 가</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="header-div">
		<div>
			<a href="/"><img class="logo" alt="logo" src="/images/logo.png"></a>
			<form class="form-inline" action="/">
				<input class="form-control" type="text" placeholder="편안한가 쇼핑 검색">
				<button class="btn btn-outline-light text-dark" type="submit">검색</button>
			</form>
			<a href="#">로그인</a>
			<a href="#">회원가입</a>
		</div>
	</div>
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
	<br />