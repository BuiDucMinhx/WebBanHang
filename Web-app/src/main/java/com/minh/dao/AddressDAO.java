package com.minh.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.minh.entity.Address;


public interface AddressDAO extends JpaRepository<Address, String> {
	@Query(value = "SELECT * FROM Address a Where username = ?1", nativeQuery = true)
	Address getAddress(String username);
}
