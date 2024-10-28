package com.ict.sns.vo;

public class AddrVO {
	
	// 원래는 로그인 한 상태에서 주소록을 사용하므로 사용자
	private String Postcode, Address, DetailAddress, ExtraAddress;

	public String getPostcode() {
		return Postcode;
	}

	public void setPostcode(String postcode) {
		Postcode = postcode;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getDetailAddress() {
		return DetailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		DetailAddress = detailAddress;
	}

	public String getExtraAddress() {
		return ExtraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		ExtraAddress = extraAddress;
	}
	
	
}
