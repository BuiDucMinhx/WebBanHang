package com.minh.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.minh.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, Integer>{
	@Query(value = "SELECT * FROM categories", nativeQuery = true)
	List<Category> AllLoai();
}
