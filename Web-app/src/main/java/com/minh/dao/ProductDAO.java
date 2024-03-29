package com.minh.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.minh.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer>{
	@Query(value = "select TOP(10) * from products order by price desc", nativeQuery = true)
	List<Product> Top10();
	
	@Query(value = "select * from products", nativeQuery = true)
	Page<Product> findAll(Pageable pageable);
	
	@Query(value = "select * from products ORDER BY name ASC; ", nativeQuery = true)
	Page<Product> findAllaz(Pageable pageable);
	
	@Query(value = "select * from products ORDER BY name DESC; ", nativeQuery = true)
	Page<Product> findAllza(Pageable pageable);
	
	@Query(value = "select * from products ORDER BY price DESC; ", nativeQuery = true)
	Page<Product> findAlllow(Pageable pageable);
	
	@Query(value = "select * from products ORDER BY price ASC; ", nativeQuery = true)
	Page<Product> findAllhigh(Pageable pageable);
	
	@Query(value = "SELECT * FROM Products WHERE categoryid = ?1 ", nativeQuery = true)
	ArrayList<Product> ListTheoLoai1(int number1);
	
	@Query(value = "SELECT * FROM Products WHERE name like ?1", nativeQuery = true)
	Page<Product> fillByKeywords(String keywords, Pageable pageable);
	
	@Query(value = "SELECT * FROM Products WHERE categoryid = ?1 ", nativeQuery = true)
	Page<Product> ListTheoLoai(int number1, Pageable pageable);
	
}