package com.minh.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
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
import com.minh.entity.Address;
import com.minh.entity.Product;
import com.minh.service.ProductService;
import com.minh.service.SessionService;
import com.minh.service.ShoppingCartService;

// Các điều khiển liên quan đến đặt hàng và giỏ hàng
@Controller
public class ShoppingCartController {
	@Autowired ShoppingCartService cartService; 
	@Autowired SessionService sessionService;
	@Autowired ProductService productService;

	// Chi tiết sản phẩm theo id
	@RequestMapping("/product{id}")
	public String addetail(@PathVariable Integer id, Model model) {
		Product entity =  productService.Detail(id).getProduct();
		List<Product> items = productService.Detail(id).getProducts();
		model.addAttribute("loadInfo",entity);
	    model.addAttribute("items", items);	
	    return "home/product"; 
	}

	// Vào giỏ hàng
	@RequestMapping("/cart")
	public String view(Model model) {
		model.addAttribute("cart", cartService); 
		sessionService.set("count", cartService.getCount());
		return "home/cart"; 
	}
	
	// Thêm vào giỏ
	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable int id) {
		cartService.add(id);
		sessionService.set("count",  cartService.getCount());
		return "redirect:/cart"; // direct đến cart
	}
	
	// Tính tổng tiền
	@ModelAttribute("total")
	public double total(){
		List<Product> list = new ArrayList<>(cartService.getItems());
		double total = 0;
		for(Product i: list) {
			total = total + i.getPrice() * i.getQty();
		}
		sessionService.set("totals", total);
		return total;
	}
	
	// Xóa
	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") int id) {
		cartService.remove(id);
		sessionService.set("count", cartService.getCount());
		return "redirect:/cart"; 
	}
	
	// Update
	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") int id, @RequestParam("qty") Integer qty) {
		cartService.update(id,qty);	
		sessionService.set("count", cartService.getCount());
		return "redirect:/cart"; 
	}
	
	// Clear
	@RequestMapping("/cart/clear")
	public String clear() {
		sessionService.set("count", cartService.getCount());
		cartService.clear();
		return "redirect:/cart"; 
	}
	
	// Nhấn Checkout lần 1
	@PreAuthorize("isAuthenticated")
	@GetMapping("/checkout")
	public String checkout(Model model, @ModelAttribute("total") Double total) {
		Address address = new Address();
		model.addAttribute("cart", cartService);
		model.addAttribute("addressForm", address);
		return "home/checkout"; 
	}
	
	// Checkout lần 2
	@PreAuthorize("hasAnyRole('ADMIN','USER')")
	@PostMapping("/checkout")
	public String checkout2(Model model,  @ModelAttribute("addressForm") @Valid Address entity, Errors errors, Principal principal) throws Exception{
		String userName = principal.getName();
		productService.Checkout(entity, userName);
		return "home/ok"; 
	}
}
