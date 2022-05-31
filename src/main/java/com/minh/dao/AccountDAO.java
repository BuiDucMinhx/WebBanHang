package com.minh.dao;


import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.minh.entity.Account;



public interface AccountDAO extends JpaRepository<Account, String>{
	@Query("SELECT u FROM Account u WHERE u.email = :uemail")
	Account findByEmail(@Param("uemail") String email);
	
	@Query(value="select * from accounts a inner join Authorities au on a.username = au.username where RoleId = ?1", nativeQuery = true)
	List<Account> findbyroleid(String roleid);
	
}
