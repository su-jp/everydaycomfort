//카테고리부르기
function callList(request) {
	category = document.getElementById(request.getAttribute('id')).getAttribute('id');
	location.href = '/shop/' + category;
}
//수량 null체크
function cartNullCheck(request) {
	let qty = document.getElementById('productQuantity').options[document.getElementById('productQuantity').selectedIndex].text;
	if (qty == "수량선택") {
		Swal.fire({
			icon: 'warning',
			text: '수량을 선택해주세요.',
			confirmButtonText: '확인'
		});
	} else if (request.id == "cart") {
		addItem(qty);
	} else {
		directPurchase();
	}
}
//바로구매
function directPurchase() {
	let qty = document.getElementById('productQuantity').options[document.getElementById('productQuantity').selectedIndex].text;
	let data = {
		productId: $("#productId").val(),
		productTitle: $("#productTitle").val(),
		productImage: $("#productImage").val(),
		productLprice: $("#productPrice").val(),
		productQuantity: qty
	}
	$.ajax({
		type: "POST",
		url: "/api/shop/item/" + data.productId,
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function() {
		location.href = "/user/orderpage/" + data.productId;
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
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
	}).fail(function(error) {
		alert(JSON.stringify(error));
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
				error: function(error) {
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
//결제수단확인
function paymentChk() {
	let payment = document.getElementById('payment').options[document.getElementById('payment').selectedIndex].text;
	if (payment == "결제수단선택") {
		Swal.fire({
			icon: 'warning',
			text: '결제수단을 선택해주세요.',
			confirmButtonText: '확인'
		}).then(() => {
			return;
		});
	} else if (payment == "무통장입금") {
		makeOrder(payment);
	} else if (payment == "카드결제") {
		Swal.fire({
			icon: 'info',
			text: '카드결제 기능은 준비중입니다.',
			confirmButtonText: '확인'
		}).then(() => {
			return;
		});
	}
}
//무통장입금 주문하기
function makeOrder(payment) {
	var cartId = $("#cartId").val();
	var amount = $('#totAmount').html();
	var coupon = $("#usedCoupon").html();
	let data = {
		totalAmount: Math.ceil(amount),
		payment: payment,
		point: $('#point').val(),
		couponId : $("#coupon").val(),
		couponAmount : Math.ceil(coupon)
	};
	//장바구니 구매
	if (cartId == "undefined" || cartId == null || cartId == "") {
		$.ajax({
			type: "POST",
			url: "/api/order",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function() {
			//장바구니비우기
			$.ajax({
				type: "DELETE",
				url: "/api/cart/all",
				dataType: "json"
			}).done(function() {
				location.href = "/user/orderpage/success";
			});
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	} else { //바로 구매
		$.ajax({
			type: "POST",
			url: "/api/order/" + cartId,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function() {
			//장바구니비우기
			$.ajax({
				type: "DELETE",
				url: "/api/cart/" + cartId,
				dataType: "json"
			}).done(function() {
				location.href = "/user/orderpage/success";
			});
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
//주문취소
function cancelOrder(orderId) {
	Swal.fire({
		icon: 'warning',
		text: '주문을 취소하시겠습니까?',
		showCancelButton: true,
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				type: "PUT",
				url: "/api/order/cancel/" + orderId,
				dataType: "json"
			}).done(function() {
				Swal.fire({
					icon: 'info',
					text: '주문이 취소되었습니다.',
					confirmButtonText: '확인'
				}).then(() => {
					location.href = "/user/orderlist";
				});
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		} else {
			console.log(orderNum);
			return;
		}
	});
}
//적립금 & 쿠폰 실시간반영
$(document).ready(function() {
	//적립금
	$("#point").on("change", function() {
		var total = $("#originalTot").val();
		var originalAmount = $("#originalAmount").val();
		var dis = document.getElementById('coupon').options[document.getElementById('coupon').selectedIndex].id;
		var disAmount = originalAmount * dis;
		var input = $("#point").val();
		var totPoint = $("#totPoint").val();
		if (input > totPoint || input < 0) {
			Swal.fire({
				icon: 'warning',
				text: '사용 가능 범위를 벗어났습니다.',
				confirmButtonText: '확인'
			}).then(() => {
				$("#point").val(totPoint);
				$("#usedPoint").html(totPoint);
			});
		} else {
			$("#usedPoint").html(input);
			$("#totAmount").html(total - input - disAmount);
		}
	});
	//쿠폰
	$("#coupon").on("change", function() {
		var total = $("#originalTot").val();
		var input = $("#point").val();
		var originalAmount = $("#originalAmount").val();
		var dis = document.getElementById('coupon').options[document.getElementById('coupon').selectedIndex].id;
		var disAmount = originalAmount * dis;
		$("#usedCoupon").html(disAmount);
		$("#totAmount").html(total - disAmount - input);
	});
});