package com.minh.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.minh.dao.AccountDAO;
import com.minh.dao.AddressDAO;
import com.minh.dao.DetailDAO;
import com.minh.dao.OrderDAO;
import com.minh.dao.ProductDAO;
import com.minh.entity.Account;
import com.minh.entity.Address;
import com.minh.entity.Detail;
import com.minh.entity.Order;
import com.minh.entity.Product;
import com.minh.model.ProductModel;

@Service
public class OtherServiceImpl implements OtherService {
	@Autowired ProductDAO productDao;
	@Autowired AccountDAO accountDao;
	@Autowired AddressDAO addressDao;
	@Autowired ShoppingCartService cart; 
	@Autowired OrderDAO orderDao;
	@Autowired ProductDAO productdao;
	@Autowired DetailDAO detailDao;
	@Autowired HttpSession session;
	
	// Chi tiết sản phẩm
	@Override
	public ProductModel Detail(Integer id) {
		ProductModel Productmodel = new ProductModel();
		Product entity = productDao.getById(id);
		Product item = new Product();
		int loai = entity.getCategory().getId();
	    ArrayList<Product> items = productDao.ListTheoLoai1(loai);
	    Productmodel.setProduct(entity);
	    Productmodel.setProducts(items);
		return Productmodel;
	}
	
	// Đặt hàng
	@Override
	public void Checkout(Address entity, String userName) {

		Account account = accountDao.getById(userName);
		Address address = addressDao.getAddress(userName);
		try {
			if (address == null) {
				address = new Address(entity.getCountry(), entity.getFirstname(), entity.getLastname(), entity.getAddress(), entity.getEmail(), entity.getPhone(), account);
			    addressDao.save(address);
			}
		} catch (Exception e) { }

		try {
        	address.setCountry(entity.getCountry());
        	address.setFirstname(entity.getFirstname());
        	address.setLastname(entity.getLastname());
        	address.setAddress(entity.getAddress());
            address.setEmail(entity.getEmail());
            address.setPhone(entity.getPhone());
            addressDao.save(address);  

			// Tạo mã hóa đơn
	        int code;
            float sum = 0;
	        code = (int) Math.floor(((Math.random() * 899999) + 100000));
	        
	        // Ngày hiện tại
	        Date date = new Date();
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	        String strDate = formatter.format(date);
            
	        List<Product> listItem = new ArrayList<>(cart.getItema());
	        for (Product i : listItem) {			
	            Product product = productDao.getById(i.getId());
	            Order order = new Order(entity.getAddress(),String.valueOf(code),false,i.getQty(),strDate,account,product);
	            orderDao.save(order); // core
	            product.setQty(product.getQty()-i.getQty());
	            productdao.save(product);
	            sum += product.getPrice()*i.getQty();
	            System.out.println("save order success!");
	        }
	        Detail detail = new Detail();
            detail.setCreatedate(strDate);
            detail.setStatus(false);
            detail.setTotal(sum);
            detail.setName(String.valueOf(code));
            detail.setUsername(userName);
            detailDao.save(detail);
            session.setAttribute("count", 0);
	        cart.clear();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
