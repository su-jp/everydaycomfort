//카테고리부르기
function callList(request) {
	category = document.getElementById(request.getAttribute('id')).getAttribute('id');
	location.href = '/shop/' + category;
}
//수량 null체크
function cartNullCheck() {
	let qty = document.getElementById('productQuantity').options[document.getElementById('productQuantity').selectedIndex].text;
	if(qty == "수량선택") {
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
				location.href = "/";
				//임시로 메인페이지 이동
			} else {
				return;
			}
		});
	});
}