package com.minh.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.minh.entity.Authority;
import com.minh.service.AccountService;


// Phân quyền với RestfulAPi
@CrossOrigin("*")
@RestController
public class AuthRestController {
	@Autowired AccountService accountService;
	
	@GetMapping("/rest/authorities")
	public Map<String, Object> getAuthorities(){
		Map<String, Object> data = accountService.dataAuthorize();
		return data;
	}
	
	@PostMapping("/rest/authorities")
	public Authority create(@RequestBody Authority authority) {
		return accountService.saveAutorize(authority);
	}
	
	@DeleteMapping("/rest/authorities/{id}")
	public void delete(@PathVariable("id") Integer id) {
		accountService.deleteAutorizeId(id);
	}
}
