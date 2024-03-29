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
import com.minh.entity.Address;
import com.minh.entity.Detail;
import com.minh.entity.Order;
import com.minh.model.MyAccountModel;
import com.minh.service.AccountService;
import com.minh.service.UserService;

// Quản lí tải khoản của tôi
@Controller
public class MyAccountController {
	@Autowired UserService userService;
	@Autowired AccountService accountService;
	
    @GetMapping("/tab1")
    public String tab(Model model, Principal principal) {
        String username = principal.getName();
        ArrayList<Detail> list = accountService.detailList(username);
		model.addAttribute("location", 0);
		model.addAttribute("order", list);
        return "tab/_tab1";
    }
    
    @GetMapping("/tab2")
    public String tab2(Model model, Principal principal) {
    	String username = principal.getName();
    	MyAccountModel myaccount = accountService.getMyAccountInfo(username);
    	model.addAttribute("user", myaccount);
        return "tab/_tab2";
    }
    
    @GetMapping("/tab3")
    public String tab3(Model model, Principal principal) {
    	String username = principal.getName();
    	Address entity = accountService.getAccountAddress(username);
    	model.addAttribute("ad", entity);
        return "tab/_tab3";
    }
    
    @PostMapping("/update")
	public String saveChange(Model model, @ModelAttribute("user") @Valid MyAccountModel entity, Errors errors, BindingResult result, Principal principal) {		
    	String err = userService.validateUser(principal, entity);
		if (!err.isEmpty()) {
	        ObjectError error = new ObjectError("globalError", err);
	        result.addError(error);
	    }
		if (result.hasErrors()) {
	        return "tab/_tab2";
	    }
		String username = principal.getName();
		accountService.saveChangeInfo(username, entity.getFullname(), entity.getNewpassword());
		model.addAttribute("msg","Lưu thông tin thành công");
		return "redirect:/account";
	}
    
    @RequestMapping("/view{name}")
    public String otherDetail(Model model, @PathVariable String name  ) {
    	List<Order> orders = accountService.getOrderByName(name);
    	double sum = 0;
    	for (Order order : orders) {
			sum += (order.getProduct().getPrice()*order.getQty());
			model.addAttribute("price", sum);
		}
    	model.addAttribute("list", orders);
    	return "home/invoice";
    }
    
}
