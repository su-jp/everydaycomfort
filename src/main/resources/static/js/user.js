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
//