package com.minh.dao;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.minh.entity.VerifyToken;

public interface VerificationTokenDAO extends JpaRepository<VerifyToken, Integer> {
	@Query(value = "select * from Verifytoken where token = ?1", nativeQuery = true)
	VerifyToken getByToken(String token);
	
	@Transactional
	@Modifying
	@Query(value = "UPDATE Verifytoken SET token = ?1, expridate = ?2 where username = ?3", nativeQuery = true)
	void UpdateToken(String token, Date date, String username);
	
}
