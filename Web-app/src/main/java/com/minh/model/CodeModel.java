package com.minh.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
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

public class CodeModel implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	String number1;
	String number2;
	String number3;
	String number4;
	String number5;
	String number6;
}