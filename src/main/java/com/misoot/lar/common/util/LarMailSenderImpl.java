package com.misoot.lar.common.util;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.misoot.lar.common.interfaces.LarMailSender;

@Service
public class LarMailSenderImpl implements LarMailSender {
	private static final Logger logger = LoggerFactory.getLogger(LarMailSenderImpl.class);

	@Autowired
	JavaMailSender javaMailSender;

	private final String from = "KHMisootLar@gmail.com";
	
	@Override
	public boolean emailSender(String purpose, String to, String subject, String content) {
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
				mimeMessage.setFrom(new InternetAddress(from, purpose));
				mimeMessage.setSubject(subject);
				mimeMessage.setText(content, "UTF-8", "HTML");
			}
		};

		try {
			javaMailSender.send(preparator);
			return true;
		} catch (MailException me) {
			logger.error("MailException", me);
			return false;
		}
	}
}
