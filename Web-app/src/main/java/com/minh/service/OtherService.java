package com.minh.service;



import org.springframework.stereotype.Service;

import com.minh.entity.Address;

import com.minh.model.ProductModel;

@Service
public interface OtherService {
	// Chi tiết sản phẩm
	ProductModel Detail(Integer id);
	
	// Đặt hàng
	void Checkout(Address address, String username); 
	
}
