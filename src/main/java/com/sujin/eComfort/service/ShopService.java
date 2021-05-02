package com.sujin.eComfort.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sujin.eComfort.dto.OrderRequestDTO;
import com.sujin.eComfort.dto.ProductSaveRequestDTO;
import com.sujin.eComfort.model.Cart;
import com.sujin.eComfort.model.Coupon;
import com.sujin.eComfort.model.OrderDetail;
import com.sujin.eComfort.model.PurchaseOrder;
import com.sujin.eComfort.model.User;
import com.sujin.eComfort.repository.CartRepository;
import com.sujin.eComfort.repository.CouponRepository;
import com.sujin.eComfort.repository.OrderDetailRepository;
import com.sujin.eComfort.repository.PurchaseOrderRepository;
import com.sujin.eComfort.repository.UserRepository;

@Service
public class ShopService {
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PurchaseOrderRepository purchaseOrderRepository;
	
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	
	@Autowired
	private CouponRepository couponRepository;
	
	@Transactional
	public void addItem(ProductSaveRequestDTO productSaveRequestDTO, User requestUser) {
		User user = userRepository.findById(requestUser.getId())
				.orElseThrow(()->{
					return new IllegalArgumentException("상품 담기 실패 : 회원 정보를 찾을 수 없습니다.");
				});
		
		Cart cart = Cart.builder()
				.user(user)
				.productId(productSaveRequestDTO.getProductId())
				.productTitle(productSaveRequestDTO.getProductTitle())
				.productImage(productSaveRequestDTO.getProductImage())
				.productPrice(productSaveRequestDTO.getProductLprice())
				.productQuantity(productSaveRequestDTO.getProductQuantity())
				.build();
		cartRepository.save(cart);
	}
	
	@Transactional(readOnly = true)
	public List<Cart> list(User user) {
		return cartRepository.findAllByUserId(user.getId());
	}
	
	@Transactional
	public void delete(int id) {
		cartRepository.deleteById(id);
	}
	
	@Transactional
	public void update(int id, int request) {
		Cart cart = cartRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("상품 담기 실패 : 회원 정보를 찾을 수 없습니다.");
				});
		cart.setProductQuantity(cart.getProductQuantity()+request);
	}
	
	@Transactional
	public void deleteAll(User user) {
		cartRepository.deleteAllByUserId(user.getId());
	}
	
	@Transactional(readOnly = true)
	public List<Cart> directPurchase(String productId) {
		return cartRepository.findAllByProductId(productId);
	}
	
	@Transactional
	public void order(OrderRequestDTO orderRequestDTO, User requestUser) {
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HHmmss");
		List<Cart> carts = cartRepository.findAllByUserId(requestUser.getId());
		PurchaseOrder order = PurchaseOrder.builder()
				.user(requestUser)
				.totalAmount(orderRequestDTO.getTotalAmount())
				.payMethod(orderRequestDTO.getPayment())
				.payInfo(orderRequestDTO.getPayInfo())
				.usedCoupon(orderRequestDTO.getCoupon())
				.usedPoint(orderRequestDTO.getPoint())
				.orderNum(dateFormat.format(now)+"-"+requestUser.getId()+"-"+timeFormat.format(now))
				.build();
		if(order.getPayMethod().equals("무통장입금")) {
			order.setOrderStatus("결제대기중");
			order.setPayInfo("국민 000000-00-000000");
		}
		if(order.getUsedPoint() > 0) {
			User user = userRepository.findById(requestUser.getId())
					.orElseThrow(()->{
						return new IllegalArgumentException("포인트 사용 실패 : 회원 정보를 찾을 수 없습니다.");
					});
			user.setPoint(requestUser.getPoint() - order.getUsedPoint());
		}
		purchaseOrderRepository.save(order);
		for(Cart cart : carts) {
			OrderDetail detail = OrderDetail.builder()
					.purchaseOrder(order)
					.productTitle(cart.getProductTitle())
					.productImage(cart.getProductImage())
					.productPrice(cart.getProductPrice())
					.productQuantity(cart.getProductQuantity())
					.build();
			orderDetailRepository.save(detail);
		}
	}
	
	@Transactional
	public void directOrder(int cartId, OrderRequestDTO orderRequestDTO, User requestUser) {
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HHmmss");
		Cart cart = cartRepository.findById(cartId)
				.orElseThrow(()->{
					return new IllegalArgumentException("구매 실패 : 물품 정보를 찾을 수 없습니다.");
				});
		PurchaseOrder order = PurchaseOrder.builder()
				.user(requestUser)
				.totalAmount(orderRequestDTO.getTotalAmount())
				.payMethod(orderRequestDTO.getPayment())
				.payInfo(orderRequestDTO.getPayInfo())
				.usedCoupon(orderRequestDTO.getCoupon())
				.usedPoint(orderRequestDTO.getPoint())
				.orderNum(dateFormat.format(now)+"-"+requestUser.getId()+"-"+timeFormat.format(now))
				.build();
		if(order.getPayMethod().equals("무통장입금")) {
			order.setOrderStatus("결제대기중");
			order.setPayInfo("국민 000000-00-000000");
		}
		if(order.getUsedPoint() > 0) {
			User user = userRepository.findById(requestUser.getId())
					.orElseThrow(()->{
						return new IllegalArgumentException("포인트 사용 실패 : 회원 정보를 찾을 수 없습니다.");
					});
			user.setPoint(requestUser.getPoint() - order.getUsedPoint());
		}
		purchaseOrderRepository.save(order);
		OrderDetail detail = OrderDetail.builder()
				.purchaseOrder(order)
				.productTitle(cart.getProductTitle())
				.productImage(cart.getProductImage())
				.productPrice(cart.getProductPrice())
				.productQuantity(cart.getProductQuantity())
				.build();
		orderDetailRepository.save(detail);
	}
	
	@Transactional
	public String findLatestOrderNum(User user) {
		List<PurchaseOrder> pos = purchaseOrderRepository.findAllByUserIdOrderByIdDesc(user.getId());
		return pos.get(0).getOrderNum();
	}
	
	@Transactional
	public List<PurchaseOrder> findOrders(User user) {
		return purchaseOrderRepository.findAllByUserIdOrderByIdDesc(user.getId());
	}
	
	@Transactional
	public PurchaseOrder findOrderByOrderId(int orderId) {
		PurchaseOrder po = purchaseOrderRepository.findById(orderId)
				.orElseThrow(()->{
					return new IllegalArgumentException("주문 조회 실패 : 주문 번호를 찾을 수 없습니다.");
				});
		return po;
	}
	
	@Transactional
	public List<OrderDetail> callOrderDetails(int poId) {
		return orderDetailRepository.findAllByPurchaseOrderId(poId);
	}
	
	@Transactional
	public void cancelOrder(int orderId) {
		PurchaseOrder po = purchaseOrderRepository.findById(orderId)
				.orElseThrow(()->{
					return new IllegalArgumentException("주문 취소 실패 : 주문 번호를 찾을 수 없습니다.");
				});
		po.setOrderStatus("주문취소");
		if(po.getUsedPoint() > 0) {
			User user = userRepository.findById(po.getUser().getId())
					.orElseThrow(()->{
						return new IllegalArgumentException("사용 포인트 복원 실패 : 회원 정보를 찾을 수 없습니다.");
					});
			user.setPoint(user.getPoint() + po.getUsedPoint());
		}
	}
	
	@Transactional
	public List<Coupon> callCoupons(User user) {
		return couponRepository.findAllByUserId(user.getId());
	}
	
	@Transactional
	public double checkCouponById(int id) {
		Coupon coupon = couponRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("쿠폰 적용 실패 : 쿠폰 정보를 찾을 수 없습니다.");
				});
		return coupon.getDisAmount();
	}
	
	@Transactional
	public int chkCoupon(User user, String couponCode) {
		Coupon requestCoupon = couponRepository.findByUserIdAndCouponCode(user.getId(), couponCode);
		if(requestCoupon == null) {
			Coupon coupon = Coupon.builder()
					.user(user)
					.couponName("봄맞이 이벤트 30% 할인쿠폰")
					.couponCode(couponCode)
					.minAmount(50000)
					.disAmount(0.3)
					.maxAmount(20000)
					.validity(7)
					.validChk(0)
					.build();
			couponRepository.save(coupon);
			return 0;
		} else {
			return 1;
		}
	}
}
