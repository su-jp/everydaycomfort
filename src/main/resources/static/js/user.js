//회원가입 null체크
function joinNullCheck() {
	let data = {
		email: $("#email").val(),
		password: $("#password").val(),
		passwordChk: $("#passwordChk").val(),
		name: $("#name").val(),
		phonenum: $("#phonenum").val(),
		address: $("#address").val()
	};
	if (!data.email) {
		Swal.fire({
			icon: 'warning',
			text: '이메일을 입력해주세요.'
		});
		document.getElementById("email").focus;
	} else if (!data.password) {
		Swal.fire({
			icon: 'warning',
			text: '비밀번호를 입력해주세요.'
		});
		document.getElementById("password").focus;
	} else if (!data.passwordChk) {
		Swal.fire({
			icon: 'warning',
			text: '비밀번호 확인창을 입력해주세요.'
		});
		document.getElementById("passwordChk").focus;
	} else if (!data.name) {
		Swal.fire({
			icon: 'warning',
			text: '이름을 입력해주세요.'
		});
		document.getElementById("name").focus;
	} else if (!data.phonenum) {
		Swal.fire({
			icon: 'warning',
			text: '전화번호를 입력해주세요.'
		});
		document.getElementById("phonenum").focus;
	} else if (!data.address) {
		Swal.fire({
			icon: 'warning',
			text: '주소를 입력해주세요.'
		});
		document.getElementById("address").focus;
	} else {
		join();
	}
}
//회원가입
function join() {
	let data = {
		email: $("#email").val(),
		password: $("#password").val(),
		name: $("#name").val(),
		phonenum: $("#phonenum").val(),
		address: $("#address").val()
	};
	$.ajax({
		type: "POST",
		url: "/joinProc",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function() {
		location.href = "/";
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
	alert("회원가입이 완료되었습니다.");
}
//로그인요청
function loginRequired() {
	Swal.fire({
		icon: 'info',
		title: '로그인이 필요합니다.',
		text: '로그인 페이지로 이동하시겠습니까?',
		showCancelButton: true,
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			location.href = "/login";
		} else {
			return;
		}
	})
}
//로그인실패
function loginAlert() {
	Swal.fire({
		icon: 'error',
		title: '로그인에 실패하였습니다.',
		text: '로그인 페이지로 돌아가시겠습니까?',
		showCancelButton: true,
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			location.href = "/login";
		} else {
			location.href = "/";
		}
	})
}