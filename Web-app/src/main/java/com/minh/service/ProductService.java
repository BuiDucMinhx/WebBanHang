package com.minh.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.minh.entity.Address;
import com.minh.entity.Category;
import com.minh.entity.Product;
import com.minh.model.ProductModel;

@Service
public interface ProductService {
	ProductModel Detail(Integer id);

	List<Category> listCate();

	Page<Product> searchbykey(String kword, Pageable pageable);

	Page<Product> searchbylist(int id, Pageable pageable);

	Page<Product> findAll(Pageable pageable);

	List<Product> top10();
	
	Map<String, Integer> surveyMapInventory();

	Map<String, Integer> surveyMapSold();

	double size(int listNumber);
	
	void Checkout(Address address, String username); 
}
