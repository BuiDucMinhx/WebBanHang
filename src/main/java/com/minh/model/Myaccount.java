package com.minh.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
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

public class Myaccount implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String email;
	private String fullname;
	@NotBlank(message = "Không được bỏ trống mật khẩu")
	String curpassword;

	@NotBlank(message = "Không được bỏ trống mật khẩu mới")
	String newpassword;

	@NotBlank(message = "Không được bỏ trống nhập lại mật khẩu")
	String repassword;

}