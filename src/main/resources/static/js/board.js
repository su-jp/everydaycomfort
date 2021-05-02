//글작성 null체크
function boardNullCheck() {
	let data = {
		title: $("#title").val(),
		content: $("#content").val()
	};
	if (!data.title) {
		Swal.fire({
			icon: 'warning',
			text: '제목을 작성해주세요.',
			confirmButtonText: '확인'
		});
	} else if (data.content == "" || !data.content) {
		Swal.fire({
			icon: 'warning',
			text: '내용을 작성해주세요.',
			confirmButtonText: '확인'
		});
	} else {
		boardWrite();
	}
}
//글등록
function boardWrite() {
	let data = {
		boardcode: $("#boardCode").val(),
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
			text: '답변을 기다려주세요.',
			confirmButtonText: '확인'
		}).then(() => {
			location.href = `/board/${data.boardcode}`;
		});
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
}
//글 수정 null체크
function boardUpdateNullCheck() {
	let data = {
		title: $("#title").val(),
		content: $("#content").val()
	};
	if (!data.title) {
		Swal.fire({
			icon: 'warning',
			text: '제목을 작성해주세요.',
			confirmButtonText: '확인'
		});
	} else if (data.content == "" || !data.content) {
		Swal.fire({
			icon: 'warning',
			text: '내용을 작성해주세요.',
			confirmButtonText: '확인'
		});
	} else {
		boardUpdate();
	}
}
//글 수정
function boardUpdate() {
	let data = {
		boardId: $("#boardId").val(),
		title: $("#title").val(),
		content: $("#content").val(),
	};
	$.ajax({
		type: "PUT",
		url: "/api/board/" + data.boardId,
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function(resp) {
		if (resp == 500) {
			Swal.fire({
				icon: 'error',
				title: '글 수정 실패',
				text: '관리자에게 문의하세요.'
			});
		} else {
			Swal.fire({
				icon: 'success',
				text: '글 수정이 완료되었습니다.',
				confirmButtonText: '확인'
			}).then(() => {
				location.href = `/board/${data.boardId}`;
			});
		}
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
}
//글 삭제
function boardDelete() {
	Swal.fire({
		icon: 'warning',
		title: '삭제하면 복구할 수 없습니다.',
		text: '글을 삭제하시겠습니까?',
		showCancelButton: true,
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			let id = $("#boardId").val();
			var category = $("#boardCategory").val();
			$.ajax({
				type: "DELETE",
				url: "/api/board/" + id,
				dataType: "json"
			}).done(function() {
				Swal.fire({
					icon: 'info',
					text: '글이 삭제되었습니다.',
					confirmButtonText: '확인'
				}).then(() => {
					location.href = "/board/" + category;
				});
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		} else {
			return;
		}
	});
}
//댓글 null체크
function commentNullCheck() {
	var content = $("#commentContent").val();
	if (!content) {
		Swal.fire({
			icon: 'warning',
			text: '내용을 작성해주세요.',
			confirmButtonText: '확인'
		});
	} else {
		commentWrite();
	}
}
//댓글 등록
function commentWrite() {
	let data = {
		userId: $("#userId").val(),
		boardId: $("#boardId").val(),
		content: $("#commentContent").val()
	};
	$.ajax({
		type: "POST",
		url: "/api/board/comment",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function(resp) {
		if (resp === 500) {
			Swal.fire({
				icon: 'error',
				title: '댓글 등록 실패',
				text: '관리자에게 문의하세요.'
			});
		} else {
			Swal.fire({
				icon: 'success',
				text: '작성한 댓글이 등록되었습니다.',
				confirmButtonText: '확인'
			}).then(() => {
				$.ajax({
					type: "GET",
					url: `/board/${data.boardId}`,
					dataType: "text",
					error: function() {
						alert(JSON.stringify(error));
					},
					success: function(data) {
						$('#bodyContents').children().remove();
						$('#bodyContents').html(data);
					}
				});
			});
		}
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
}
//댓글 수정창 열기
function showCommentUpdate(id) {
	const area = document.getElementById(`myCommentArea${id}`);
	const btn = document.getElementById("btn-close");
	if (area.hidden) {
		$('#originalComment').html('');
		area.hidden = false;
		btn.hidden = false;
	} else {
		commentUpdate(id);
	}
}
//댓글 수정창 닫기
function closeCommentUpdate(id) {
	var content = document.getElementById("commentContentText").value;
	const area = document.getElementById(`myCommentArea${id}`);
	const btn = document.getElementById("btn-close");
	if (area.hidden) {
		area.hidden = false;
		btn.hidden = false;
	} else {
		$('#originalComment').html(content);
		area.hidden = true;
		btn.hidden = true;
	}
}
//댓글 수정
function commentUpdate(commentId) {
	let data = {
		boardId: $("#boardId").val(),
		content: $(`#myCommentArea${commentId}`).val()
	};
	$.ajax({
		type: "PUT",
		url: "/api/board/comment/" + commentId,
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function(resp) {
		if (resp == 500) {
			Swal.fire({
				icon: 'error',
				title: '댓글 수정 실패',
				text: '관리자에게 문의하세요.'
			});
		} else {
			Swal.fire({
				icon: 'success',
				text: '댓글 수정이 완료되었습니다.',
				confirmButtonText: '확인'
			}).then(() => {
				$.ajax({
					type: "GET",
					url: `/board/${data.boardId}`,
					dataType: "text",
					error: function() {
						alert(JSON.stringify(error));
					},
					success: function(data) {
						$('#bodyContents').children().remove();
						$('#bodyContents').html(data);
					}
				});
			});
		}
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
}
//댓글 삭제
function commentDelete(commentId) {
	Swal.fire({
		icon: 'warning',
		title: '삭제하면 복구할 수 없습니다.',
		text: '댓글을 삭제하시겠습니까?',
		showCancelButton: true,
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			var boardId = $("#boardId").val();
			$.ajax({
				type: "DELETE",
				url: "/api/board/comment/" + commentId,
				dataType: "json"
			}).done(function() {
				Swal.fire({
					icon: 'info',
					text: '댓글이 삭제되었습니다.',
					confirmButtonText: '확인'
				}).then(() => {
					$.ajax({
						type: "GET",
						url: "/board/" + boardId,
						dataType: "text",
						error: function() {
							alert(JSON.stringify(error));
						},
						success: function(data) {
							$('#bodyContents').children().remove();
							$('#bodyContents').html(data);
						}
					});
				});
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		} else {
			return;
		}
	});
}
//검색 null체크
function boardSearchNullCheck() {
	var keyword = $("#boardKeyword").val();
	let sort = document.getElementById('sort').options[document.getElementById('sort').selectedIndex].text;
	if (!keyword) {
		Swal.fire({
			icon: 'warning',
			text: '검색어를 입력해주세요.',
			confirmButtonText: '확인'
		});
		return false;
	} else if(sort == "분류") {
		Swal.fire({
			icon: 'warning',
			text: '분류를 선택해주세요.',
			confirmButtonText: '확인'
		});
		return false;
	} else {
		return true;
	}
}