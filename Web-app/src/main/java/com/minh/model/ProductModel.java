package com.minh.model;

import java.util.ArrayList;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.minh.entity.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter

@Entity
public class ProductModel {
	@Id
	Product product;
	ArrayList<Product> products;
	
}