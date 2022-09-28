package com.minh.service.Impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.minh.dao.VerificationTokenDAO;
import com.minh.entity.Account;
import com.minh.entity.Address;
import com.minh.entity.Authority;
import com.minh.entity.Detail;
import com.minh.entity.Order;
import com.minh.entity.Role;
import com.minh.entity.VerificationToken;
import com.minh.model.MyAccountModel;
import com.minh.service.AccountService;
import com.minh.service.MailerService;
import com.minh.service.ShoppingCartService;

@Service
public class AccountServiceImpl implements AccountService {
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
	public ArrayList<Detail> detailList(String username){
		ArrayList<Detail> list = detailDao.getbyusername(username);
		return list;
	}
	
	@Override
	public MyAccountModel getMyAccountInfo(String username) {
    	MyAccountModel myaccount = new MyAccountModel();
    	Account account = accountDao.getById(username);
    	myaccount.setEmail(account.getEmail());
    	myaccount.setFullname(account.getFullname());
    	myaccount.setCurpassword("");
    	myaccount.setNewpassword("");
    	myaccount.setRepassword("");
		return myaccount;
	}
	
	@Override
	public Address getAccountAddress(String username) {
    	Address entity = new Address();
    	Address address = addressDao.getAddress(username);
    	entity.setFirstname(address.getFirstname());
    	entity.setLastname(address.getLastname());
    	entity.setAddress(address.getAddress());
    	entity.setPhone(address.getPhone());
    	entity.setCountry(address.getCountry());
		return entity;
	}


	@Override
	public void saveChangeInfo(String username, String fullName, String password) {
		Account account = accountDao.getById(username);
		account.setPassword(pe.encode(password));
		account.setFullname(fullName);
		accountDao.save(account);
	}
	@Override
	public List<Order> getOrderByName(String name){
		List<Order> orders = orderDao.getOrderByName(name);
		return orders;
	}
	
	
	@Override
	public String findEmail(String email) {
		email = accountDao.findEmail(email);
		return email;
	}
	
	@Override
	public Map<String, Object> dataAuthorize(){
		Map<String, Object> data = new HashMap<>();
		data.put("authorities", authorityDao.findAll());
		data.put("roles", roleDao.findAll());
		data.put("accounts", accountDao.findAll());
		return data;
	}
	
	@Override
	public Authority saveAutorize(Authority authority) {
		return authorityDao.save(authority);
	}
	
	@Override
	public void deleteAutorizeId(Integer id) {
		authorityDao.deleteById(id);
	}

	@Override
	public int sendCodeEmail(String email) {
		int code = (int) Math.floor(((Math.random() * 899999) + 100000));
		try {
			String token = UUID.randomUUID().toString();
			createVerificationToken(email, token);
			mailer.send(email, "Mã xác nhận đăng kí tài khoản MXgear", String.valueOf(code));
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return code;
	}
	
	@Override
	public void SaveRegister(MyAccountModel myaccount) {
		Account account = new Account();
		account.setUsername(myaccount.getEmail());
		account.setEmail(myaccount.getEmail());
		account.setPassword(pe.encode(myaccount.getNewpassword()) );
		
		Authority authority = new Authority();
		authority.setAccount(account);
		authority.setRole(new Role("USER","Users"));
		
		Address address = new Address("Guest Country","Guest FirstName","Guest LastName","Guess Address","Guest Phone","guest@gmail.com",account);
		accountDao.saveAndFlush(account);
		authoritydao.save(authority);
		addressDao.saveAndFlush(address);
	}
	
	@Override
	public void forgetPassword(String email) {
		try {
			String token = UUID.randomUUID().toString();
			createVerificationToken(email, token);
			System.out.println("http://localhost:8080/reset?token="+token);
			mailer.send(email, "Nhấp vào link sau để reset mật khẩu của bạn", "http://localhost:8080/reset?token="+token);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	DateFormat formatter = new SimpleDateFormat("YYYY-MM-DD"); 
	
	@Override
	public boolean newPassword(String username, String password, String token) {
		VerificationToken verificationToken = verificationDao.getByToken(token);
	    Calendar cal = Calendar.getInstance();
		if( verificationToken == null || ((verificationToken.getExpirydate().getTime() - cal.getTime().getTime()) <=0 )) {
			System.out.println(verificationToken.getExpirydate().getTime()+" - " + cal.getTime().getTime() );
			return false;
		}
		
		Account account = accountDao.getById(username);
		account.setPassword(pe.encode(password));
		accountDao.save(account);
		return true;
	}
	
	@Autowired
	VerificationTokenDAO verificationDao;
	
	@Override
	public void createVerificationToken(String email, String token) {
		VerificationToken myToken = new VerificationToken();
		myToken.setUsername(email);
		myToken.setToken(token);
		java.util.Date date = new java.util.Date();    
		myToken.setExpirydate(date);
		verificationDao.save(myToken);
	}
}
