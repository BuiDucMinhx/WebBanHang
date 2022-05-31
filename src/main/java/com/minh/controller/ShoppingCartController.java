package com.minh.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.minh.dao.AccountDAO;
import com.minh.dao.AddressDAO;
import com.minh.dao.CategoryDAO;
import com.minh.dao.DetailDAO;
import com.minh.dao.OrderDAO;
import com.minh.dao.ProductDAO;
import com.minh.entity.Account;
import com.minh.entity.Address;
import com.minh.entity.Category;
import com.minh.entity.Detail;
import com.minh.entity.Order;
import com.minh.entity.Product;
import com.minh.service.SessionService;
import com.minh.service.ShoppingCartService;

// Các điều khiển lian6 quan đến đặt hàng và giỏ hàng
@Controller
public class ShoppingCartController {
	@Autowired ShoppingCartService cart; 
	@Autowired CategoryDAO dao; 
	@Autowired SessionService sessionService;
	@Autowired ProductDAO productDao;
	@Autowired HttpSession session;
	@Autowired AddressDAO addressDao;
	@Autowired AccountDAO accountDao;
	@Autowired OrderDAO orderDao;
	@Autowired DetailDAO detailDao;
	@Autowired ProductDAO productdao;
	
	@RequestMapping("/category/index")
	public String index(Model model) {
		Category item = new Category();
		model.addAttribute("item", item);
		List<Category> items = dao.findAll();
		model.addAttribute("items", items);
		return "category/index";
	}
 
	@RequestMapping("/product{id}")
	public String addetail(@PathVariable Integer id, Model model) {
		Product entity = productDao.getById(id);
		model.addAttribute("loadInfo",entity);
		int loai = entity.getCategory().getId();
		Product item = new Product();
	    model.addAttribute("item", item);
	    List<Product> items = productDao.ListTheoLoai1(loai);
	    model.addAttribute("items", items);
	    System.out.println(loai);
		return "home/product"; // direct đến detail
	}
	@RequestMapping("/detail")	
	public String detail() {
		return "home/product"; // view detail sản phẩm
	}

	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable int id) {
		cart.add(id);
		session.setAttribute("count", cart.getCount());
		return "redirect:/cart"; // direct đến cart
	}
	
	@RequestMapping("/cart")
	public String view(Model model) {
		model.addAttribute("cart", cart); 
		session.setAttribute("count", cart.getCount());
		return "home/cart"; 
	}
	
	// Tính tổng tiền
	@ModelAttribute("total")
	public double total(){
		List<Product> list = new ArrayList<>(cart.getItema());
		double total = 0;
		for(Product i: list) {
			total = total + i.getPrice() * i.getQty();
		}
		sessionService.set("totals",total);
		return total;
	}
	
	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") int id) {
		cart.remove(id);
		session.setAttribute("count", cart.getCount());
		return "redirect:/cart"; 
	}
	
	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") int id, @RequestParam("qty") Integer qty) {
		cart.update(id,qty);	
		session.setAttribute("count", cart.getCount());
		return "redirect:/cart"; 
	}
	
	@RequestMapping("/cart/clear")
	public String clear() {
		session.setAttribute("count", cart.getCount());
		
		cart.clear();
		return "redirect:/cart"; 
	}
	
	// Nhấn Checkout lần 1 dùng get
	@PreAuthorize("isAuthenticated")
	@GetMapping("/checkout")
	public String checkout(Model model, @ModelAttribute("total") Double total) {
		model.addAttribute("cart", cart); //cart: 1 session sevice đã đc implement
		Address address = new Address();
		model.addAttribute("addressForm", address);
		return "home/checkout"; 
	}
	
	// Checkout lần 2 dùng post
	@PreAuthorize("hasAnyRole('ADMIN','USER')")
	@PostMapping("/checkout")
	public String checkout2(Model model,  @ModelAttribute("addressForm") @Valid Address entity, Errors errors, Principal principal) throws Exception{
		String userName = principal.getName();
		Account account = accountDao.getById(userName);
		Address address = addressDao.getAddress(userName);
		try {
			if (address == null) {
				address = new Address(entity.getCountry(), entity.getFirstname(), entity.getLastname(), entity.getAddress(), entity.getEmail(), entity.getPhone(), account);
			    addressDao.save(address);
			}
		} catch (Exception e1) { }
		if(errors.hasErrors()){
			model.addAttribute("cart", cart);
			return "home/checkout";
		}
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
	        code = (int) Math.floor(((Math.random() * 899999) + 100000));
	        Date date = new Date();
	        
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	        String strDate = formatter.format(date);
            
            System.out.println(String.valueOf(code) + strDate);
            float sum = 0;
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
		return "home/ok"; 
	}
	
}
