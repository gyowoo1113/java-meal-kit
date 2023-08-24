package co.yedam.mealkit.order.detail.service;

public class OrderDetailVO {
	private int orderDetailCount;
	private int orderDetailPrice;
	private int productId;
	private int orderId;
	
	public OrderDetailVO() {}
	public OrderDetailVO(int orderDetailCount, int orderDetailPrice, int productId, int orderId) {
		super();
		this.orderDetailCount = orderDetailCount;
		this.orderDetailPrice = orderDetailPrice;
		this.productId = productId;
		this.orderId = orderId;
	}
}
