package com.minh.controller;

import java.io.File;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.minh.entity.Category;
import com.minh.entity.Product;
import com.minh.service.ProductService;
import com.minh.service.SessionService;

// Các loại điều khiển chính và phụ
@Controller
public class IndexController {
	@Autowired SessionService sessionService;
	@Autowired ProductService productService;
	
	@GetMapping("/index")
	public String index(Model model) {
		sessionService.set("count", 0);
		return "/home/index";
	}
	
	@GetMapping("/about")
	public String about(Model model) {
		return "/home/about";
	}
	
	@RequestMapping("/shop")
	public String liszt(Model model) {
		return "home/shopage"; 
	}
	
	// Tạo ra list categories
	@ModelAttribute("categories")
	public List<Category> listCate(Model model) {
		return productService.listCate();
	}
	
	// Tạo ra list sản phẩm
	@ModelAttribute("items")
	public Page<Product> show(Model model, @RequestParam("p") Optional<Integer> p) {
		Product item = new Product();
		Pageable pageable = PageRequest.of(p.orElse(0), 12);
		model.addAttribute("item", item);
		Page<Product> items = productService.findAll(pageable);
		return items;
	}
	
	// Điều khiển tới lui
	@RequestMapping("/items")
	public String showc(Model model) {
		Product item = new Product();
		model.addAttribute("item", item);
		return "home/shopage";
	}
	
	@ModelAttribute("item10")
	public List<Product> top10(Model model) {
		List<Product> items = productService.top10();
		return items;
	}
	
	@PreAuthorize("hasAnyRole('ADMIN','USER')")
	@GetMapping("/account")
	public String account(Model model) {
		return "/home/myaccount";
	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@RequestMapping("/manager")
	public String manage(Model model) {
		return "/auth/index";
	}
	
	@RequestMapping("/rest")
	public String rest(Model model) {
		sessionService.set("count", 0);
		return "/auth/RestfulAPI";
	}
	
	@RequestMapping("/upload/send")
	public String send(@RequestParam("attach") MultipartFile attach) {
		try {   
			if(!attach.isEmpty()) {
				String fileName = attach.getOriginalFilename(); 
				File file = new File("C:/Users/admin/Java 6/Web-app/src/main/resources/static/imgs/".toString() + fileName);
				attach.transferTo(file);
				return "redirect:/manager"; 
			}
		}catch (Exception e) { }
		return "redirect:/manager";
	}
	
	// phần Quản lí_______________________________________________
	@RequestMapping("/product")
	public String product(Model model) {
		return "/auth/product";
	}
	
	@RequestMapping("/category")
	public String category(Model model) {
		return "/auth/category";
	}
	
	@RequestMapping("/order")
	public String order(Model model) {
		return "/auth/order";
	}
	
	@RequestMapping("/ordered")
	public String ordered(Model model) {
		return "/auth/ordered";
	}
	
	@RequestMapping("/guest")
	public String guest(Model model) {
		return "/auth/guest";
	}
	
	@RequestMapping("/user")
	public String user(Model model) {
		return "/auth/user";
	}
	
	@RequestMapping("/authorize")
	public String authorize(Model model) {
		return "/auth/authorize";
	}
}
