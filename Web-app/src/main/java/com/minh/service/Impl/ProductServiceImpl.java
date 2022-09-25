package com.minh.service.Impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.minh.dao.AccountDAO;
import com.minh.dao.AddressDAO;
import com.minh.dao.AuthorityDAO;
import com.minh.dao.CategoryDAO;
import com.minh.dao.DetailDAO;
import com.minh.dao.OrderDAO;
import com.minh.dao.ProductDAO;
import com.minh.dao.RoleDAO;
import com.minh.entity.Account;
import com.minh.entity.Address;
import com.minh.entity.Category;
import com.minh.entity.Detail;
import com.minh.entity.Order;
import com.minh.entity.Product;
import com.minh.model.ProductModel;
import com.minh.service.MailerService;
import com.minh.service.ProductService;
import com.minh.service.ShoppingCartService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired ProductDAO productDao;
	@Autowired AccountDAO accountDao;
	@Autowired AddressDAO addressDao;
	@Autowired ShoppingCartService cart; 
	@Autowired OrderDAO orderDao;
	@Autowired ProductDAO productdao;
	@Autowired DetailDAO detailDao;
	@Autowired HttpSession session;
	@Autowired CategoryDAO cateDao;
	@Autowired BCryptPasswordEncoder pe;
	@Autowired DetailDAO detaildao;
	@Autowired AuthorityDAO authorityDao;
	@Autowired RoleDAO roleDao;
    @Autowired AuthorityDAO authoritydao;
	@Autowired MailerService mailer;
	
	
	@Override
	public ProductModel Detail(Integer id) {
		ProductModel Productmodel = new ProductModel();
		Product entity = productDao.getById(id);
		int loai = entity.getCategory().getId();
	    ArrayList<Product> items = productDao.ListTheoLoai1(loai);
	    Productmodel.setProduct(entity);
	    Productmodel.setProducts(items);
		return Productmodel;
	}
	
	
	// Listloai
	@Override
	public List<Category> listCate(){
		return cateDao.AllLoai();
	}
	
	@Override
	public Page<Product> searchbykey(String kword, Pageable pageable){
		Page<Product> pageresult = productdao.fillByKeywords("%" + kword + "%", pageable);
		return pageresult;
	}
	
	@Override
	public Page<Product> searchbylist(int id, Pageable pageable){
		Page<Product> list = productDao.ListTheoLoai(id, pageable);
		return list;
	}
	
	@Override
	public Page<Product> findAll(Pageable pageable){
		Page<Product> list = productDao.findAll(pageable);
		return list;
	}
	
	@Override
	public List<Product> top10(){
		List<Product> list = productDao.Top10();
		return list;
	}
	

	@Override
	public Map<String, Integer> surveyMapInventory(){
		Map<String, Integer> surveyMap = new LinkedHashMap<>();
		List<Product> list = productdao.findAll();

		for (int i = 0; i < list.size(); i++) {
			surveyMap.put(list.get(i).getName(), list.get(i).getQty());	
		}
		return surveyMap;
	}
	
	@Override
	public Map<String, Integer> surveyMapSold(){
		Map<String, Integer> surveyMap = new LinkedHashMap<>();
		List<Product> list = productdao.findAll();

		for (int i = 0; i < list.size(); i++) {
			surveyMap.put(list.get(i).getName(), 100-list.get(i).getQty());
		}
		return surveyMap;
	}

	@Override
	public double size(int listNumber){
		List<Detail> list1 = detaildao.findalltrue();
		List<Detail> list2 = detaildao.findallfalse();
		if(listNumber == 1) {
			return list1.size();
		}
		return list2.size();
	}
	
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
