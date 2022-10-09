package com.minh.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.minh.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String>{
	@Query(value = "select * from accounts a inner join Authorities au on a.username = au.username where RoleId = ?1", nativeQuery = true)
	List<Account> findbyroleid(String roleid);
	
	@Query(value = "SELECT email FROM Accounts WHERE email = ?1", nativeQuery = true)
	String findEmail(String email);
}
