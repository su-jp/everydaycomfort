//회원가입 비밀번호 2차확인
$(function() {
	$('#password').keyup(function() {
		$('#chkNotice').html('');
	});
	$('#passwordChk').keyup(function() {
		if ($('#password').val() != $('#passwordChk').val()) {
			$('#chkNotice').html('비밀번호가 일치하지 않습니다.');
			$('#chkNotice').attr('color', '#f82a2aa3');
			const target = document.getElementById("joinBtn");
			target.disabled = true;
		} else {
			$('#chkNotice').html('비밀번호가 일치합니다.');
			$('#chkNotice').attr('color', '#199894b3');
			const target = document.getElementById('joinBtn');
			target.disabled = false;
		}
	});
});
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
		validCheck();
	}
}
//아이디 중복 검사
function emailCheck() {
	var email = $("#email").val();
	$.ajax({
		type: "GET",
		url: "/emailCheck?email=" + email,
		success: function(resp) {
			if (resp == 1) {
				Swal.fire({
					icon: 'warning',
					text: '이미 사용중인 이메일입니다.'
				});
			} else if (email == "") {
				Swal.fire({
					icon: 'warning',
					text: '이메일을 입력해주세요.'
				});
			} else {
				Swal.fire({
					icon: 'success',
					text: '사용 가능한 이메일입니다.'
				});
				document.getElementById("validChk").value = "0";
			}
		}, error: function() {
			alert(JSON.stringify(error));
		}
	});
}
//중복검사 여부 확인
function validCheck() {
	var validChk = $("#validChk").val();
	if (validChk == "1") {
		Swal.fire({
			icon: 'warning',
			text: '이메일 중복검사를 진행해주세요.'
		});
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
		document.getElementById("validChk").value = "1";
		Swal.fire({
			icon: 'success',
			text: '회원가입이 완료되었습니다.'
		}).then(() => {
			location.href = "/";
		});
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
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
	});
}
//로그인실패
function loginAlert() {
	Swal.fire({
		icon: 'error',
		title: '로그인에 실패하였습니다.',
		text: '아이디와 비밀번호를 확인해주세요.',
	}).then(() => {
		location.href = "/login";
	});
}