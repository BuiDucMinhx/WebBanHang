package com.minh.dao;

import java.util.ArrayList;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.minh.entity.Order;
import com.minh.model.OrderModel;

public interface OrderDAO extends JpaRepository<Order, Long>{
	@Query(value = "SELECT * FROM Orders WHERE name = ?1", nativeQuery = true)
	List<Order> getOrderByName(String name);

	@Query(value = "DELETE FROM orders WHERE name = ?1", nativeQuery = true)
	ArrayList<Order> deletebyname(String name);   
	
	@Query("SELECT new OrderModel(o.name, o.createdate, sum(o.product.price * o.qty), o.status) FROM Order o WHERE o.account.username = ?1 GROUP BY o.name, o.createdate, o.status")
	ArrayList<OrderModel> getOrderModel(String username);  
}