package com.misoot.lar.user.model.vo;

public class Purchase {

	private String merchant_uid;
	private int purchase_user_index;
	private int purchase_used_coupon_index;
	private String purchase_date;
	private String purchase_lecture_list;
	private String paid_amount;
	private String buyer_email;
	private String buyer_name;
	private String buyer_tel;
	private String status;
	private String pay_method;
	private String paid_at;
	private String coupon_name;

	public Purchase() {
	}

	public Purchase(String merchant_uid, int purchase_user_index, int purchase_used_coupon_index, String purchase_date,
			String purchase_lecture_list, String paid_amount, String buyer_email, String buyer_name, String buyer_tel,
			String status, String pay_method, String paid_at, String coupon_name) {
		this.merchant_uid = merchant_uid;
		this.purchase_user_index = purchase_user_index;
		this.purchase_used_coupon_index = purchase_used_coupon_index;
		this.purchase_date = purchase_date;
		this.purchase_lecture_list = purchase_lecture_list;
		this.paid_amount = paid_amount;
		this.buyer_email = buyer_email;
		this.buyer_name = buyer_name;
		this.buyer_tel = buyer_tel;
		this.status = status;
		this.pay_method = pay_method;
		this.paid_at = paid_at;
		this.coupon_name = coupon_name;
	}

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	public int getPurchase_user_index() {
		return purchase_user_index;
	}

	public void setPurchase_user_index(int purchase_user_index) {
		this.purchase_user_index = purchase_user_index;
	}

	public int getPurchase_used_coupon_index() {
		return purchase_used_coupon_index;
	}

	public void setPurchase_used_coupon_index(int purchase_used_coupon_index) {
		this.purchase_used_coupon_index = purchase_used_coupon_index;
	}

	public String getPurchase_date() {
		return purchase_date;
	}

	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}

	public String getPurchase_lecture_list() {
		return purchase_lecture_list;
	}

	public void setPurchase_lecture_list(String purchase_lecture_list) {
		this.purchase_lecture_list = purchase_lecture_list;
	}

	public String getPaid_amount() {
		return paid_amount;
	}

	public void setPaid_amount(String paid_amount) {
		this.paid_amount = paid_amount;
	}

	public String getBuyer_email() {
		return buyer_email;
	}

	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public String getBuyer_tel() {
		return buyer_tel;
	}

	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getPaid_at() {
		return paid_at;
	}

	public void setPaid_at(String paid_at) {
		this.paid_at = paid_at;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	@Override
	public String toString() {
		return "Purchase [merchant_uid=" + merchant_uid + ", purchase_user_index=" + purchase_user_index
				+ ", purchase_used_coupon_index=" + purchase_used_coupon_index + ", purchase_date=" + purchase_date
				+ ", purchase_lecture_list=" + purchase_lecture_list + ", paid_amount=" + paid_amount + ", buyer_email="
				+ buyer_email + ", buyer_name=" + buyer_name + ", buyer_tel=" + buyer_tel + ", status=" + status
				+ ", pay_method=" + pay_method + ", paid_at=" + paid_at + ", coupon_name=" + coupon_name + "]";
	}

}
