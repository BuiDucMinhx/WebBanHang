package com.minh.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.minh.dao.ProductDAO;

import com.minh.entity.Product;
import com.minh.model.ProductModel;



@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService{
	@Autowired
	ProductDAO dao;
	
	Map<Integer, Product> map = new HashMap<>();
	
	// Thêm giỏ hàng dựa vào id sản phẩm
	@Override
	public Product add(Integer id) {
		// Kiểm tra id có trong giỏ hàng hay chưa
		Product item = map.get(id);
		
		// Nếu chưa có trong giỏ hàng
		if(item == null) {
			// Lấy 1 món hàng
			List<Product> itema = dao.findAll();
			
			item = itema.get(id);
		
			item.setQty(1); // Số lượng bằng 1
		
			map.put(id,item); // thêm vào giỏ hàng
		}else {
			// nếu có trong giỏ hàng tăng sl +1
			item.setQty(item.getQty()+1);
		}
		return item;
	}
	
	// Show sản phẩm dựa vào id sản phẩm
	@Override
	public Product show(Integer id) {
		Product item = map.get(id);
		return item;
	}

	@Override
	public void remove(Integer id) {
		// Dựa vào id xóa món hàng
		map.remove(id);
	}

	@Override
	public Product update(Integer id, int qty) {
		// Cập nhật số lượng theo id
		Product item = map.get(id);
		item.setQty(qty);
		return item;
	}

	@Override
	public void clear() {
		// Xóa hết giỏ hàng
		map.clear();
	}
	
	// Lấy ra danh sách các món hàng
	@Override
	public Collection<Product> getItema() {
		return map.values();
	}

	@Override
	public int getCount() {
		return map.values().stream().mapToInt(item->item.getQty()).sum();
		
	}
	// tổng tiền của giỏ hàng
	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item->item.getQty()*item.getPrice()).sum();
	}
	
	@Autowired ProductDAO productdao;
	@Override
	public List<Product> page(int no, int size){
		Pageable pageable = PageRequest.of(no, size);
		Page<Product> pageresult = productdao.findall(pageable);
		return pageresult.toList();
	}
	
	@Override
	public List<Product> pageaz(int no, int size){
		Pageable pageable = PageRequest.of(no, size);
		Page<Product> pageresult = productdao.findallaz(pageable);
		return pageresult.toList();
	}
	
	@Override
	public List<Product> pageza(int no, int size){
		Pageable pageable = PageRequest.of(no, size);
		Page<Product> pageresult = productdao.findallza(pageable);
		return pageresult.toList();
	}
	
	@Override
	public List<Product> pagelow(int no, int size){
		Pageable pageable = PageRequest.of(no, size);
		Page<Product> pageresult = productdao.findalllow(pageable);
		return pageresult.toList();
	}
	
	@Override
	public List<Product> pagehigh(int no, int size){
		Pageable pageable = PageRequest.of(no, size);
		Page<Product> pageresult = productdao.findallhigh(pageable);
		return pageresult.toList();
	}
	

}
