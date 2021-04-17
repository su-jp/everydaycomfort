$(function() {
	//상단바
	$('nav a').on('click', function() {
		$(this).addClass('on');
		$(this).siblings().removeClass('on');
	})
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

function closePop() {
	popup = document.getElementById("pop")
	popup.style.visibility = "hidden"
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