package com.minh.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.minh.entity.Detail;

public interface DetailDAO extends JpaRepository<Detail, Integer>{
	@Query(value="SELECT * FROM Details Where status = 0",nativeQuery = true)
	List<Detail> findalltrue();
	
	@Query(value="SELECT * FROM Details Where status = 1",nativeQuery = true)
	List<Detail> findallfalse();
	
	
	
	@Query(value="SELECT * FROM Details Where username = ?1",nativeQuery = true)
	ArrayList<Detail> getbyusername(String username);
	
	@Query(value="SELECT * FROM Details Where name = ?1",nativeQuery = true)
	ArrayList<Detail> getbyname(String name);
}