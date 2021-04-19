//회원가입
function join() {
	let data = {
		email: $("#email").val(),
		password: $("#password").val(),
		name: $("#name").val(),
		phonenum: $("#phonenum").val(),
		address: $("#address").val()
	}
	$.ajax({
		type: "POST",
		url: "/joinProc",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function() {
			location.href = "/";
		},
		error: function(error) {
			alert(JSON.stringify(error));
		}
	});
	alert("회원가입이 완료되었습니다.");
}
//로그인요청
function loginAlert() {
	if(confirm("로그인이 필요합니다.\n로그인 페이지로 이동하시겠습니까?")) {
		location.href = "/login";
	} else {
		return;
	}
}