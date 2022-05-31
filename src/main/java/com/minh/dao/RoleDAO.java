package com.minh.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.minh.entity.Role;

public interface RoleDAO extends JpaRepository<Role, String> {

}
