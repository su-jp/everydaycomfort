function nullCheck() {
	let data = {
		title: $("#title").val(),
		content: $("#content").val(),
	};
	if (!data.title) {
		alert("제목을 작성해주세요.");
	} else if (!data.content) {
		alert("내용을 작성해주세요.");
	} else {
		boardWrite();
	}
}

function boardWrite() {
	let data = {
		board: $("#boardCode").val(),
		title: $("#title").val(),
		content: $("#content").val(),
		userId: $("#userId").val()
	};
	$.ajax({
		type: "POST",
		url: "/api/board",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function(resp) {
		alert("작성한 질문이 등록되었습니다.\n답변을 기다려주세요.");
		location.href = "/qna";
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
}