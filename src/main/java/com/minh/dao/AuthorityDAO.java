package com.minh.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.minh.entity.Authority;

public interface AuthorityDAO extends JpaRepository<Authority, Integer>{
	
	
}
