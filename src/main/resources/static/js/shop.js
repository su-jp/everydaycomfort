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
			text: '수량을 선택해주세요.'
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
				//임시로 메인페이지 이동
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
						alert('통신실패!!');
					},
					success: function(data) {
						// Contents 영역 삭제
						$('#bodyContents').children().remove();
						// Contents 영역 교체
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