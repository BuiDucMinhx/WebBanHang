package com.minh.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.minh.dao.AccountDAO;
import com.minh.dao.AuthorityDAO;
import com.minh.dao.CategoryDAO;
import com.minh.dao.DetailDAO;
import com.minh.dao.ProductDAO;
import com.minh.entity.Account;
import com.minh.entity.Category;
import com.minh.entity.Detail;
import com.minh.entity.Product;
import com.minh.service.SessionService;
import com.minh.service.ShoppingCartService;

// Tạo các restful api để giao tiếp với front-end
@CrossOrigin("*")
@RestController
public class RestfulAPIController {
	@Autowired ShoppingCartService service;
	@Autowired ProductDAO productdao;
	@Autowired CategoryDAO Catedao;
	@Autowired AccountDAO accountdao; 
	@Autowired AuthorityDAO authoritydao; 
	@Autowired SessionService sessionservice;
	@Autowired DetailDAO detaildao;
	
	
	//Product
	@GetMapping("/rest/products")
	public List<Product>  getAll1(Model model) {
		return productdao.findAll();
	}
	
	@GetMapping("/rest/products0/{no}")
	public List<Product>  getAll1z(Model model, @PathVariable int no) {
		return service.page(no, 12);
	}
	
	@GetMapping("/rest/productsaz/{no}")
	public List<Product>  getAl(Model model, @PathVariable int no) {
		return service.pageaz(no, 12);
	}
	
	@GetMapping("/rest/productsza/{no}")
	public List<Product>  getAlza(Model model, @PathVariable int no) {
		return service.pageza(no, 12);
	}
	
	@GetMapping("/rest/productslow/{no}")
	public List<Product>  getAllow(Model model, @PathVariable int no) {
		return service.pagelow(no, 12);
	}
	
	@GetMapping("/rest/productshigh/{no}")
	public List<Product>  getAllhigh(Model model, @PathVariable int no) {
		return service.pagehigh(no, 12);
	}
	
	@GetMapping("/rest/search/{no}")
	public List<Product>  search(Model model, @PathVariable int no, @RequestParam("keywords") String kw) {
		return service.search(no, 12, kw);
	}
	
	@GetMapping("/rest/products/{id}")
	public Product  getOne1(Model model, @PathVariable("id") Integer id) {
		return productdao.findById(id).get();
	}	
	@PostMapping("/rest/products")
	public Product Post1(@RequestBody Product product) {
		productdao.save(product);
		return product ;
	}
	@PutMapping("/rest/products/{id}")
	public Product Put1(@PathVariable("id") String id, @RequestBody Product product) {
		productdao.save(product);
		return product;
	}
	@DeleteMapping("/rest/products/{id}")
	public void Delete1(@PathVariable("id") Integer id) {
		productdao.deleteById(id);
	}
	
	//Category
	@GetMapping("/rest/categories")
	public ResponseEntity<List<Category>>  getAll2(Model model) {
		return ResponseEntity.ok(Catedao.findAll());
	}
	@GetMapping("/rest/categories/{id}")
	public ResponseEntity<Category> getOne2(@PathVariable("id") Integer id){
		if(!Catedao.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(Catedao.findById(id).get());
	}
	@PostMapping("/rest/categories")
	public ResponseEntity<Category> post2(@RequestBody Category category){
		if(Catedao.existsById(category.getId())) {
			return ResponseEntity.badRequest().build();
		}
		Catedao.save(category);
		return ResponseEntity.ok(category);
	}
	@PutMapping("/rest/categories/{id}")
	public ResponseEntity<Category> put2(@PathVariable("id") Integer id, @RequestBody Category category){
		if(!Catedao.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		Catedao.save(category);
		return ResponseEntity.ok(category);
	}
	@DeleteMapping("/rest/categories/{id}")
	public ResponseEntity<Void> delete2(@PathVariable("id") Integer id){
		if(!Catedao.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		Catedao.deleteById(id);
		return ResponseEntity.ok().build();
	}
	
	//Order detail
	@GetMapping("/rest/details")
	public List<Detail>  getAll3(Model model) {
		return detaildao.findAll();
	}
	
	@GetMapping("/rest/detailt")
	public List<Detail>  gettrue(Model model) {
		return detaildao.findalltrue();
	}
	
	@GetMapping("/rest/detailf")
	public List<Detail>  getfalse(Model model) {
		return detaildao.findallfalse();
	}
	
	@GetMapping("/rest/details/{id}")
	public Detail  getOne3(Model model, @PathVariable("id") Integer id) {
		return detaildao.findById(id).get();
	}	
	
	@PutMapping("/rest/details/{id}")
	public Detail Put3(@PathVariable("id") String id, @RequestBody Detail detail) {
		detaildao.save(detail);
		return detail;
	}
	@DeleteMapping("/rest/details/{id}")
	public void Delete3(@PathVariable("id") Integer id) {
		detaildao.deleteById(id);
	}
	
	//Account guest and user
	@GetMapping("/rest/accounts")
	public List<Account>  getAll4(Model model) {
		return accountdao.findAll();
	}	
	
	@GetMapping("/rest/accounts/{roleid}")
	public List<Account>  getOnex(Model model, @PathVariable("roleid") String roleid) {
		return accountdao.findbyroleid(roleid);
	}	
		
}
