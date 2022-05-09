package com.minh.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor @AllArgsConstructor
@Getter @Setter  @Data
@Entity 
@Table(name = "Orders")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	String address;
	String name;
	boolean status;
	Integer qty;
	String createdate;
	
	@ManyToOne()
	@JoinColumn(name = "Username")
	Account account;
	
	@ManyToOne()
	@JoinColumn(name = "productid")
	Product product;
	
	public Order(String address, String name, boolean status, Integer qty, 
			String createdate,  Account account, Product product) {
		super();
		this.address = address;
		this.name = name;
		this.status = status;
		this.qty = qty;
		this.createdate = createdate;
		this.account = account;
		this.product = product;
	}
}