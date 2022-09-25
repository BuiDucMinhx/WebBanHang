package com.minh.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailInfoModel {
	String from;
	String to;
	String[] cc;
	String[] bcc;
	String subject;
	String body;
	String[] attachments;

	
	public MailInfoModel(String to, String subject, String body) {
		this.from = "MXGEAR <rongkho2@gmail.com>";
		this.to = to;
		this.subject = subject;
		this.body = body;
	}
	
}