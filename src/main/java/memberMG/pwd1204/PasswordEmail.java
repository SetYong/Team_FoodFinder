package memberMG.pwd1204;

import java.util.Properties;
import java.util.random.*;


public class PasswordEmail {
	String usereamil;
	String userpassword;
	
	public String sendEamil(String to) throws Exception{
		String result = "fail";
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust","smtp.gmail.com");
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator()
				{protected PasswordAuthentication getPasswordAuthentication() { 
					return new PasswordAuthentication(useremail, userpassword);}
				});
	}
}
