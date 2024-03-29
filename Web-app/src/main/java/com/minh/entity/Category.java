package com.minh.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "Categories")
public class Category implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	int id;
	String name;
	
	@JsonIgnore
	@OneToMany(mappedBy = "category")
	List<Product> products;
}
