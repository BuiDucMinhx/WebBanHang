package com.minh.service.Impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.minh.model.MailInfoModel;
import com.minh.service.MailerService;


@Service
public class MailerServiceImpl implements MailerService {
	@Autowired
	JavaMailSender sender;

	@Override
	public void send(MailInfoModel mail) throws MessagingException {
		
		// Tạo message
		MimeMessage message = sender.createMimeMessage();
		// Sử dụng Helper để thiết lập các thông tin cần thiết cho message
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getBody(), true);
		helper.setReplyTo(mail.getFrom());
		String[] cc = mail.getCc();
		if (cc != null && cc.length > 0) {
			helper.setCc(cc);
		}
		String[] bcc = mail.getBcc();
		if (bcc != null && bcc.length > 0) {
			helper.setBcc(bcc);
		}
		String[] attachments = mail.getAttachments();
		if (attachments != null && attachments.length > 0) {
			for (String path : attachments) {
				File file = new File(path);
				helper.addAttachment(file.getName(), file);
			}
		}
		// Gửi message đến SMTP server
		sender.send(message);

	}

	@Override
	public void send(String to, String subject, String body) throws MessagingException {
		this.send(new MailInfoModel(to, subject, body));
	}


	// xếp MailInfo vào List<MailInfo> (hàng đợi)
	List<MailInfoModel> list = new ArrayList<>();

	@Override
	public void queue(MailInfoModel mail) {
		list.add(mail);
	}

	@Override
	public void queue(String to, String subject, String body) {
		queue(new MailInfoModel(to, subject, body));
	}
	
	//  lấy MailInfo từ hàng đợi và gửi đi (5 giây sẽ kiểm tra và gửi một lần)
	@Scheduled(fixedDelay = 5000)
	public void run() {
		while (!list.isEmpty()) {
			MailInfoModel mail = list.remove(0);
			try {
				this.send(mail);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
