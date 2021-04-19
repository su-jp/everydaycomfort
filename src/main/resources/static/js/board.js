//글작성 null체크
function boardNullCheck() {
	let data = {
		title: $("#title").val(),
		content: $("#content").val()
	};
	if (!data.title) {
		Swal.fire({
			icon: 'warning',
			text: '제목을 작성해주세요.'
		});
	} else if (!data.content) {
		Swal.fire({
			icon: 'warning',
			text: '내용을 작성해주세요.'
		});
	} else {
		boardWrite();
	}
}
//글등록
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
	}).done(function() {
		Swal.fire({
			icon: 'success',
			title: '질문 등록 완료',
			text: '답변을 기다려주세요.'
		}).then(() => { 
			location.href = `/${data.board}`;
		});
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
}