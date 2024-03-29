package com.minh.service.Impl;

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
import com.minh.service.ShoppingCartService;

@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService{
	@Autowired ProductDAO productdao;
	Map<Integer, Product> map = new HashMap<>();
	
	@Override
	public Product add(Integer id) {
		Product item = map.get(id);
		if(item == null) {
			List<Product> itema = productdao.findAll();	
			item = itema.get(id);
			item.setQty(1);
			map.put(id,item); 
		}else 
			item.setQty(item.getQty()+1);
		return item;
	}
	
	@Override
	public Product show(Integer id) {
		Product item = map.get(id);
		return item;
	}

	@Override
	public void remove(Integer id) {
		map.remove(id);
	}

	@Override
	public Product update(Integer id, int qty) {
		Product item = map.get(id);
		item.setQty(qty);
		return item;
	}

	@Override
	public void clear() {
		map.clear();
	}
	
	// Lấy ra danh sách các món hàng
	@Override
	public Collection<Product> getItems() {
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
	

	@Override
	public List<Product> page(int no, int size){
		Pageable pageable = PageRequest.of(no, size);
		Page<Product> pageresult = productdao.findAll(pageable);
		return pageresult.toList();
	}
	
	@Override
	public List<Product> pageaz(int no, int size){
		Pageable pageable = PageRequest.of(no, size);
		Page<Product> pageresult = productdao.findAllaz(pageable);
		return pageresult.toList();
	}
	
	@Override
	public List<Product> pageza(int no, int size){
		Pageable pageable = PageRequest.of(no, size);
		Page<Product> pageresult = productdao.findAllza(pageable);
		return pageresult.toList();
	}
	
	@Override
	public List<Product> pagelow(int no, int size){
		Pageable pageable = PageRequest.of(no, size);
		Page<Product> pageresult = productdao.findAlllow(pageable);
		return pageresult.toList();
	}
	
	@Override
	public List<Product> pagehigh(int no, int size){
		Pageable pageable = PageRequest.of(no, size);
		Page<Product> pageresult = productdao.findAllhigh(pageable);
		return pageresult.toList();
	}
	
	
	@Override
	public List<Product> search(int no, int size, String kword){
		Pageable pageable = PageRequest.of(no, size);
		Page<Product> pageresult = productdao.fillByKeywords("%" + kword + "%", pageable);
		return pageresult.toList();
	}
	
}
