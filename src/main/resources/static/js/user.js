let index = {
	init: function() {
		$("#btn-join").on("click", () => {
			this.join();
		});
	},

	join: function() {
		let data = {
			email: $("#email").val(),
			password: $("#password").val(),
			name: $("#name").val(),
			phonenum: $("#phonenum").val(),
			address: $("#address").val()
		};

		$.ajax({
			type: "POST",
			url: "/auth/join",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert("작성한 글 등록이 완료되었습니다.");
			location.href = "/login";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}

index.init();