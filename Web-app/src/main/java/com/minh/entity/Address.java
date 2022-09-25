package com.minh.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter 
@Table(name = "Address")
public class Address implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotBlank(message = "Không bỏ trống Quốc gia")
	private String country;
	@NotBlank(message = "Vui lòng nhập họ")
	private String firstname ;
	@NotBlank(message = "Vui lòng nhập tên")
	private String lastname ;
	@NotBlank(message = "Vui lòng nhập Địa chỉ")
	private String address ;
	@NotBlank(message = "Vui lòng nhập số điện thoại")
	private String phone;
	@NotBlank(message = "Vui lòng nhập email")
	@Email(message = "Không đúng định dạng email")
	private String email;
	

	@ManyToOne()
	@JoinColumn(name = "Username")
	Account account;
	
	public Address(String country, String firstname, String lastname,String address, String phone, 
			String email,  Account account) {
		super();
		this.country = country;
		this.firstname = firstname;
		this.lastname = lastname;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.account = account;
		
	}
	
}
