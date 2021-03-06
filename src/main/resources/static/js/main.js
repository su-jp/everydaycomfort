$(function() {
	//사이드박스
	var currentPosition = 120;
	$(window).scroll(function() {
		var position = $(window).scrollTop();
		$("#sidebox").stop().animate({ "top": position + currentPosition + "px" }, 500);
	});
	//상단바
	var $menu = $('#top_menu div a'),
		$contents = $('#contents > div');
	$menu.click(function(x) {
		x.preventDefault();
		var idx = $(this).index();
		var section = $contents.eq(idx);
		var sectionDistance = section.offset().top;
		$('html,body').stop().animate({ scrollTop: sectionDistance });
	});
	$(window).scroll(function() {
		$contents.each(function() {
			if (($(this).offset().top - 100) <= $(window).scrollTop()) {
				var idx = $(this).index();
				$menu.removeClass('on');
				$menu.eq(idx).addClass('on');
			}
		});
	});
	//풀페이지
	$('#fullpage').fullpage({
		autoScrolling: true,
		scrollHorizontally: true,
		navigation: true,
		navigationPosition: 'right'
	});

});

//쿠키확인
var popcookie = getCookie('ecomfortpop');
if (popcookie == 'end') {
	closePop();
}
function getCookie(name) {
	var cookieName = name + "=";
	var x = 0;
	while (x <= document.cookie.length) {
		var y = (x + cookieName.length);
		if (document.cookie.substring(x, y) == cookieName) {
			if ((lastChrCookie = document.cookie.indexOf(";", y)) == -1)
				lastChrCookie = document.cookie.length;
			return decodeURI(document.cookie.substring(y, lastChrCookie));
		}
		x = document.cookie.indexOf(" ", x) + 1;
		if (x == 0)
			break;
	}
	return "";
}
//팝업광고
function closePop() {
	popup = document.getElementById("pop");
	popup.style.visibility = 'hidden';
}
function closePop24h() {
	setCookie("ecomfortpop", "end", 1);
	closePop();
}
function setCookie(cname, value, expire) {
	var todayValue = new Date();
	todayValue.setDate(todayValue.getDate() + expire);
	document.cookie = cname + "=" + encodeURI(value) + "; expires=" + todayValue.toGMTString() + "; path=/;";
}
//검색 null체크
function searchNullCheck() {
	var keyword = $("#keyword").val();
	if (!keyword) {
		Swal.fire({
			icon: 'warning',
			text: '검색어를 입력해주세요.',
			confirmButtonText: '확인'
		});
		return false;
	} else {
		return true;
	}
}
//쿠폰발급
function issueCoupon(userId) {
	var couponCode = $("#couponCode").val();
	if (userId == "undefined" || userId == "" || userId == null) {
		Swal.fire({
			icon: 'warning',
			text: '로그인이 필요합니다.',
			confirmButtonText: '확인'
		});
	} else {
		location.href = "/user/coupon/" + couponCode;
	}
}