package com.minh.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.minh.entity.Address;
import com.minh.entity.Category;
import com.minh.model.ProductModel;

@Service
public interface OtherService {
	// Chi tiết sản phẩm
	ProductModel Detail(Integer id);
	
	// Đặt hàng
	void Checkout(Address address, String username); 
	
	// Listloai
	List<Category> listCate();
}
