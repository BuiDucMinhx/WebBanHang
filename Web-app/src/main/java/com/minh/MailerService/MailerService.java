package com.minh.MailerService;

import javax.mail.MessagingException;


public interface MailerService {

	void send(MailInfo mail) throws MessagingException;

	void send(String to, String subject, String body) throws MessagingException;

	void queue(MailInfo mail);

	void queue(String to, String subject, String body);

}
