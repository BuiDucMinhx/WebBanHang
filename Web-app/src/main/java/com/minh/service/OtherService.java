package com.minh.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.minh.entity.Address;
import com.minh.entity.Category;
import com.minh.entity.Product;
import com.minh.model.MyAccountModel;
import com.minh.model.ProductModel;
import com.minh.entity.Detail;
import com.minh.entity.Order;

@Service
public interface OtherService {

	ProductModel Detail(Integer id);

	void Checkout(Address address, String username); 
	
	List<Category> listCate();

	Page<Product> searchbykey(String kword, Pageable pageable);

	Page<Product> searchbylist(int id, Pageable pageable);

	Page<Product> findAll(Pageable pageable);

	List<Product> top10();

	ArrayList<Detail> detailList(String username);
	
	MyAccountModel getMyAccountInfo(String username);

	Address getAccountAddress(String username);

	void saveChangeInfo(String username, String fullName, String password);

	List<Order> getOrderByName(String name);

	Map<String, Integer> surveyMapInventory();

	Map<String, Integer> surveyMapSold();

	double size(int listNumber);



}
