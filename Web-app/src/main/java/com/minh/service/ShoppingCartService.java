package com.minh.service;

import java.util.Collection;
import java.util.List;
import com.minh.model.ProductModel;
import com.minh.entity.Product;

public interface ShoppingCartService {
	// Thêm vào giỏ hoặc tăng sl
	Product add(Integer id);
	
	// get item bằng id
	Product show(Integer id);

	// Xóa theo id
	void remove(Integer id);

	// Thay đổi số lượng 
	Product update(Integer id, int qty);

	// Xóa 
	void clear();

	//Lấy tất cả các 
	Collection <Product> getItema();

	//Lấy tổng số lượng 
	int getCount();

	//Lấy tổng số tiền
	double getAmount();
	
	// Chuyển list sang page
	List<Product> page(int no, int size);
	
	// Chuyển list sang page az
	List<Product> pageaz(int no, int size);
	
	// Chuyển list sang page za
	List<Product> pageza(int no, int size);
	
	// Chuyển list sang page low
	List<Product> pagelow(int no, int size);
	
	// Chuyển list sang page high
	List<Product> pagehigh(int no, int size);
	

}
