package com.minh.service;

import javax.mail.MessagingException;

import com.minh.model.MailInfoModel;


public interface MailerService {

	void send(MailInfoModel mail) throws MessagingException;

	void send(String to, String subject, String body) throws MessagingException;

	void queue(MailInfoModel mail);

	void queue(String to, String subject, String body);

}
