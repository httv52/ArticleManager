package cn.hutaotao.article.utils.other;

import cn.hutaotao.article.utils.mail.Mail;
import cn.hutaotao.article.utils.mail.MailUtils;
import org.junit.Test;
import org.junit.Before;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import java.io.File;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.text.MessageFormat;
import java.util.Properties;


/**
 * MailUtil Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>09/20/2017</pre>
 */
public class MailUtilTest {

    @Test
    public void fun1() throws MessagingException, IOException {
        /*
         * 发邮件
		 */
        Properties pro = new Properties();
        pro.load(this.getClass().getClassLoader().getResourceAsStream("mail/email_template.properties"));

        String host = pro.getProperty("host");
        String uname = pro.getProperty("username");
        String pw = pro.getProperty("password");
        Session session = MailUtils.createSession(host, uname, pw);

        String from = pro.getProperty("from");
        String to = "413193089@qq.com";
        String subject = pro.getProperty("subject");
        String content = pro.getProperty("content");

        Mail mail = new Mail(from, to, subject, content);

        try {
            MailUtils.send(session, mail);
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}
