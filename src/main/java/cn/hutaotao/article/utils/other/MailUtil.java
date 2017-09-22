package cn.hutaotao.article.utils.other;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.File;
import java.util.*;

/**
 * Created by ht on 2017/9/20.
 */
public class MailUtil {
    private static Session session;
    private static MimeMessage msg;
    private static String user;

    private String text;
    private String html;
    private List<MimeBodyPart> attachments = new ArrayList<MimeBodyPart>();

    private MailUtil() {
    }

    public static Properties defaultConfig(Boolean debug) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.debug", "false");
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.debug", null != debug ? debug.toString() : "false");
        props.put("mail.smtp.timeout", "10000");
        props.put("mail.smtp.port", "465");
        return props;
    }

    /**
     * smtp qq
     *
     * @param debug enable debug
     * @return
     */
    public static Properties SMTP_QQ(boolean debug) {
        Properties props = defaultConfig(debug);
        props.put("mail.smtp.host", "smtp.qq.com");
        return props;
    }

    /**
     * smtp 163
     *
     * @param debug enable debug
     * @return
     */
    public static Properties SMTP_163(Boolean debug) {
        Properties props = defaultConfig(debug);
        props.put("mail.smtp.host", "smtp.163.com");
        return props;
    }

    /**
     * config username and password
     *
     * @param props    email property config
     * @param username email auth username
     * @param password email auth password
     */
    public static void config(Properties props, final String username, final String password) {
        props.setProperty("username", username);
        props.setProperty("password", password);
        config(props);
    }

    public static void config(Properties props) {
        final String username = props.getProperty("username");
        final String password = props.getProperty("password");
        user = username;
        session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        msg = new MimeMessage(session);
    }

    /**
     * set email subject
     *
     * @param subject subject title
     * @return
     * @throws MessagingException
     */
    public static MailUtil subject(String subject) throws MessagingException {
        MailUtil ohMyEmail = new MailUtil();
        msg.setSubject(subject, "UTF-8");
        return ohMyEmail;
    }

    /**
     * set email from
     *
     * @param nickName from nickname
     * @return
     * @throws MessagingException
     */
    public MailUtil from(String nickName) throws MessagingException {
        return from(nickName, user);
    }

    /**
     * set email nickname and from user
     *
     * @param nickName
     * @param from
     * @return
     * @throws MessagingException
     */
    public MailUtil from(String nickName, String from) throws MessagingException {
        try {
            nickName = MimeUtility.encodeText(nickName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        msg.setFrom(new InternetAddress(nickName + " <" + from + ">"));
        return this;
    }

    public MailUtil replyTo(String... replyTo) throws MessagingException {
        String result = Arrays.asList(replyTo).toString().replaceAll("(^\\[|\\]$)", "").replace(", ", ",");
        msg.setReplyTo(InternetAddress.parse(result));
        return this;
    }

    public MailUtil replyTo(String replyTo) throws MessagingException {
        msg.setReplyTo(InternetAddress.parse(replyTo.replace(";", ",")));
        return this;
    }

    public MailUtil to(String... to) throws Exception {
        return addRecipients(to, Message.RecipientType.TO);
    }

    public MailUtil to(String to) throws MessagingException {
        return addRecipient(to, Message.RecipientType.TO);
    }

    public MailUtil cc(String... cc) throws MessagingException {
        return addRecipients(cc, Message.RecipientType.CC);
    }

    public MailUtil cc(String cc) throws MessagingException {
        return addRecipient(cc, Message.RecipientType.CC);
    }

    public MailUtil bcc(String... bcc) throws MessagingException {
        return addRecipients(bcc, Message.RecipientType.BCC);
    }

    public MailUtil bcc(String bcc) throws MessagingException {
        return addRecipient(bcc, Message.RecipientType.BCC);
    }

    private MailUtil addRecipients(String[] recipients, Message.RecipientType type) throws MessagingException {
        String result = Arrays.asList(recipients).toString().replace("(^\\[|\\]$)", "").replace(", ", ",");
        msg.addRecipients(type, InternetAddress.parse(result));
        return this;
    }

    private MailUtil addRecipient(String recipient, Message.RecipientType type) throws MessagingException {
        msg.addRecipients(type, InternetAddress.parse(recipient.replace(";", ",")));
        return this;
    }

    public MailUtil text(String text) {
        this.text = text;
        return this;
    }

    public MailUtil html(String html) {
        this.html = html;
        return this;
    }

    public MailUtil attach(File file) throws MessagingException {
        attachments.add(createAttachment(file, null));
        return this;
    }

    public MailUtil attach(File file, String fileName) throws MessagingException {
        attachments.add(createAttachment(file, fileName));
        return this;
    }

    private MimeBodyPart createAttachment(File file, String fileName) throws MessagingException {
        MimeBodyPart attachmentPart = new MimeBodyPart();
        FileDataSource fds = new FileDataSource(file);
        attachmentPart.setDataHandler(new DataHandler(fds));
        try {
            attachmentPart.setFileName(null == fileName ? MimeUtility.encodeText(fds.getName()) : MimeUtility.encodeText(fileName));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return attachmentPart;
    }

    public void send() throws MessagingException {
        if (text == null && html == null)
            throw new NullPointerException("At least one context has to be provided: Text or Html");

        MimeMultipart cover;
        boolean usingAlternative = false;
        boolean hasAttachments = attachments.size() > 0;

        if (text != null && html == null) {
            // TEXT ONLY
            cover = new MimeMultipart("mixed");
            cover.addBodyPart(textPart());
        } else if (text == null && html != null) {
            // HTML ONLY
            cover = new MimeMultipart("mixed");
            cover.addBodyPart(htmlPart());
        } else {
            // HTML + TEXT
            cover = new MimeMultipart("alternative");
            cover.addBodyPart(textPart());
            cover.addBodyPart(htmlPart());
            usingAlternative = true;
        }

        MimeMultipart content = cover;
        if (usingAlternative && hasAttachments) {
            content = new MimeMultipart("mixed");
            content.addBodyPart(toBodyPart(cover));
        }

        for (MimeBodyPart attachment : attachments) {
            content.addBodyPart(attachment);
        }

        msg.setContent(content);
        msg.setSentDate(new Date());
        Transport.send(msg);
    }

    private MimeBodyPart toBodyPart(MimeMultipart cover) throws MessagingException {
        MimeBodyPart wrap = new MimeBodyPart();
        wrap.setContent(cover);
        return wrap;
    }

    private MimeBodyPart textPart() throws MessagingException {
        MimeBodyPart bodyPart = new MimeBodyPart();
        bodyPart.setText(text);
        return bodyPart;
    }

    private MimeBodyPart htmlPart() throws MessagingException {
        MimeBodyPart bodyPart = new MimeBodyPart();
        bodyPart.setContent(html, "text/html; charset=utf-8");
        return bodyPart;
    }
}
