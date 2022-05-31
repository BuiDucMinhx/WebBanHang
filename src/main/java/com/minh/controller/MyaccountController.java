package com.minh.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.minh.dao.AccountDAO;
import com.minh.dao.AddressDAO;
import com.minh.dao.DetailDAO;
import com.minh.dao.OrderDAO;
import com.minh.entity.Account;
import com.minh.entity.Address;
import com.minh.entity.Detail;
import com.minh.entity.Order;
import com.minh.model.Myaccount;
import com.minh.model.OrderModel;
import com.minh.service.UserService;

// Quản lí tải khoản của tôi
@Controller
public class MyaccountController {
	@Autowired AccountDAO accountDao;
	@Autowired OrderDAO orderDao;
	@Autowired DetailDAO detailDao;
	@Autowired UserService validationService;
	@Autowired AddressDAO addressDao;
	
    @GetMapping("/tab1")
    public String tab(Model model, Principal principal) {
        String username = principal.getName();
        ArrayList<Detail> list1 = detailDao.getbyusername(username);
		ArrayList<OrderModel> list = orderDao.getOrderModel(username);
		System.out.println(list);
		model.addAttribute("location", 0);
		model.addAttribute("order", list1);
        return "tab/_tab1";
    }
    
    @GetMapping("/tab2")
    public String tab2(Model model, Principal principal) {
    	String username = principal.getName();
    	Account account = accountDao.getById(username);
    	Myaccount myaccount = new Myaccount();
    	myaccount.setEmail(account.getEmail());
    	myaccount.setFullname(account.getFullname());
    	myaccount.setCurpassword("");
    	myaccount.setNewpassword("");
    	myaccount.setRepassword("");
    	model.addAttribute("user", myaccount);
        return "tab/_tab2";
    }
    
    @PostMapping("/update")
	public String save(Model model, @ModelAttribute("user") @Valid Myaccount entity, Errors errors, BindingResult result, Principal principal) {		
    	String err = validationService.validateUser(principal, entity);
		if (!err.isEmpty()) {
	        ObjectError error = new ObjectError("globalError", err);
	        result.addError(error);
	    }
		if (result.hasErrors()) {
	        return "tab/_tab2";
	    }
		String username = principal.getName();
		Account account = accountDao.getById(username);
		account.setPassword(entity.getNewpassword());
		account.setFullname(entity.getFullname());
		accountDao.save(account);
		System.out.println("Lưu thông tin thành công");
		return "redirect:/account";
	}
    
    @GetMapping("/tab3")
    public String tab3(Model model, Principal principal) {
    	String username = principal.getName();
    	Address address = addressDao.getAddress(username);
    	Address entity = new Address();
    	entity.setFirstname(address.getFirstname());
    	entity.setLastname(address.getLastname());
    	entity.setAddress(address.getAddress());
    	entity.setPhone(address.getPhone());
    	entity.setCountry(address.getCountry());
    	model.addAttribute("ad", entity);
        return "tab/_tab3";
    }
    
    @RequestMapping("/view{name}")
    public String s(Model model, @PathVariable String name  ) {
    	List<Order> orders = orderDao.getOrderByName(name);
    	double sum = 0;
    	for (Order order : orders) {
			sum += (order.getProduct().getPrice()*order.getQty());
			model.addAttribute("price", sum);
		}
    	model.addAttribute("list", orders);
    	return "home/invoice";
    }
    
}
