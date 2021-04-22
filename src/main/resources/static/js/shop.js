//카테고리부르기
function callList(request) {
	category = document.getElementById(request.getAttribute('id')).getAttribute('id');
	location.href = '/shop/' + category;
}
//수량 null체크
function cartNullCheck() {
	let qty = document.getElementById('productQuantity').options[document.getElementById('productQuantity').selectedIndex].text;
	if (qty == "수량선택") {
		Swal.fire({
			icon: 'warning',
			text: '수량을 선택해주세요.',
			confirmButtonText: '확인'
		});
	} else {
		addItem(qty);
	}
}
//장바구니 상품추가
function addItem(qty) {
	let data = {
		productTitle: $("#productTitle").val(),
		productImage: $("#productImage").val(),
		productLprice: $("#productPrice").val(),
		productQuantity: qty
	}
	$.ajax({
		type: "POST",
		url: "/api/shop/item",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function() {
		Swal.fire({
			icon: 'info',
			text: '장바구니 담기 완료!',
			showCancelButton: true,
			confirmButtonText: '장바구니 확인',
			cancelButtonText: '쇼핑 계속하기'
		}).then((result) => {
			if (result.isConfirmed) {
				location.href = "/user/cart";
			} else {
				return;
			}
		});
	});
}
//장바구니 선택 삭제
function deleteSelectedItem(id) {
	Swal.fire({
		icon: 'warning',
		text: '해당 상품을 삭제하시겠습니까?',
		showCancelButton: true,
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				type: "DELETE",
				url: "/api/cart/" + id,
				dataType: "json"
			}).done(function() {
				$.ajax({
					type: "GET",
					url: "/user/cart",
					dataType: "text",
					error: function() {
						alert(JSON.stringify(error));
					},
					success: function(data) {
						$('#bodyContents').html('');
						$('#bodyContents').html(data);
					}
				});
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		} else {
			return;
		}
	});
}
//장바구니 전체 삭제
function deleteAllItems() {
	Swal.fire({
		icon: 'warning',
		text: '상품을 모두 삭제하시겠습니까?',
		showCancelButton: true,
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				type: "DELETE",
				url: "/api/cart/all",
				dataType: "json"
			}).done(function() {
				$.ajax({
					type: "GET",
					url: "/user/cart",
					dataType: "text",
					error: function() {
						alert(JSON.stringify(error));
					},
					success: function(data) {
						$('#bodyContents').children().remove();
						$('#bodyContents').html(data);
					}
				});
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		} else {
			return;
		}
	});
}
//장바구니 수량 조절
function itemQuantity(id, request, qty) {
	if (qty == 1 && request == -1) {
		Swal.fire({
			icon: 'warning',
			text: '최소 수량입니다.',
			confirmButtonText: '확인'
		}).then(() => {
			return;
		});
	} else if (qty == 10 && request == 1) {
		Swal.fire({
			icon: 'warning',
			text: '최대 수량입니다.',
			confirmButtonText: '확인'
		}).then(() => {
			return;
		});
	} else {
		$.ajax({
			type: "PUT",
			url: "/api/cart/" + id,
			data: JSON.stringify(request),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function() {
			$.ajax({
				type: "GET",
				url: "/user/cart",
				dataType: "text",
				error: function() {
					alert(JSON.stringify(error));
				},
				success: function(data) {
					$('#bodyContents').children().remove();
					$('#bodyContents').html(data);
				}
			});
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}