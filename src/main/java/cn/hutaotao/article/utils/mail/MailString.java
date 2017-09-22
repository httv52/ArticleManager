package cn.hutaotao.article.utils.mail;

import cn.hutaotao.article.model.User;
import org.springframework.ui.Model;

/**
 * Created by ht on 2017/9/20.
 */
public class MailString {

    /**
     * 根据邮箱获取邮件服务器地址
     *
     * @param user
     * @param model
     * @return
     */
    public static String getMailURL(User user, Model model) {
        String addr = user.getEmail();
        if (addr.contains("qq.com")) {
            return "http://mail.qq.com";  //u
        } else if (addr.contains("163.com")) {
            return "http://mail.163.com";//email
        } else if (addr.contains("126.com")) {
            return "http://mail.126.com";//email
        } else if (addr.contains("sina.com")) {
            return "http://mail.sina.com";
        } else if (addr.contains("gmail.com")) {
            return "https://accounts.google.com";//identifier
        }
        return "https://www.baidu.com/s?wd=%E9%82%AE%E7%AE%B1&rsv_spt=1&rsv_iqid=0xdab5702600005310&issp=1&f=8&rsv_bp=1&rsv_idx=2&ie=utf-8&rqlang=cn&tn=93380420_hao_pg&rsv_enter=1&oq=email&rsv_t=fb1fmokloziB6%2BWGPUnizfxOslb7qGFLsZODOE4QQOIkvYeGbPKk73L2eVIcFK1RxDRZ7y1n&inputT=1980&rsv_pq=e588af2e00004d82&rsv_sug3=7&rsv_sug2=0&rsv_sug4=1981";
    }

}
