package com.minh.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.minh.entity.VerificationToken;

public interface VerificationTokenDAO extends JpaRepository<VerificationToken, Integer> {
	@Query(value = "select * from Verifytoken where token = ?1", nativeQuery = true)
	VerificationToken getByToken(String token);
}
