package com.minh.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.minh.entity.Address;




public interface AddressDAO extends JpaRepository<Address, String> {
	@Query("SELECT a FROM Address a Where a.account.username = ?1")
	Address getAddress(String username);
	
	@Query("SELECT a FROM Address a Where a.email = ?1")
	Address getAddressbyemail(String email);
}
