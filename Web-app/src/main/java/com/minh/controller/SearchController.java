package com.minh.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.minh.entity.Category;
import com.minh.entity.Product;
import com.minh.service.ProductService;
import com.minh.service.SessionService;

@Controller
public class SearchController {
	@Autowired SessionService sessionService;
	@Autowired ProductService productService;
	
	// Tạo ra list categories
	@ModelAttribute("categories")
	public List<Category> listCategory(Model model) {
		return productService.listCate();
	}
	
	@RequestMapping("/search")
	public String search(Model model, @RequestParam("keywords") Optional<String> kw, @RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse(sessionService.get("keywords"));
		sessionService.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 2);
		Page<Product> list = productService.searchbykey(kwords, pageable);
		
		model.addAttribute("kwords", kwords);
		model.addAttribute("search", list);
		return "/home/listsearch";
	}
	
	@GetMapping("/list{id}")
	public String category(@PathVariable("id") int id, Model model, @RequestParam("p") Optional<Integer> p) {
		sessionService.set("id",id);
		Pageable pageable = PageRequest.of(p.orElse(0), 2);
		Page<Product> list = productService.searchbylist(id, pageable);
		
		model.addAttribute("search", list);
		return "/home/listloai";
	}
}
