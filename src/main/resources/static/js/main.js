$(document).ready(function() {
	$('nav a').on('click', function() {
		$(this).addClass('on');
		$(this).siblings().removeClass('on');
	})
});

function closePop(){
	popup = document.getElementById("pop")
	popup.style.visibility = "hidden"
}