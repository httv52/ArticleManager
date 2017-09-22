package cn.hutaotao.article.utils.format;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by ht on 2017/8/15.
 */
public class FormatUtil {
    /**
     * yyyy-MM-dd
     *
     * @param time
     * @return
     */
    public static final String formatDate(Long time){
        if(time  == null ) return "";
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return  df.format(new Date(time));
    }

    /**
     * HH:mm:ss --->24小时制
     *
     * @param time
     * @return
     */
    public static final String formatTime(Long time){
        if(time  == null ) return "";
        DateFormat df = new SimpleDateFormat("HH:mm:ss");
        return  df.format(new Date(time));
    }

    /**
     * HH:mm:ss --->12小时制
     *
     * @param time
     * @return
     */
    public static final String formatTime12(Long time){
        if(time  == null ) return "";
        DateFormat df = new SimpleDateFormat("HH:mm:ss");
        return  df.format(new Date(time));
    }

    /**
     * yyyy-MM-dd HH:mm:ss --->12小时制
     *
     * @param time
     * @return
     */
    public static final String formatDateTime12(Long time){
        if(time  == null ) return "";
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return  df.format(new Date(time));
    }

    /**
     * yyyy-MM-dd HH:mm:ss --->24小时制
     *
     * @param time
     * @return
     */
    public static final String formatDateTime(Long time){
        if(time  == null ) return "";
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:24:mm:ss");
        return  df.format(new Date(time));
    }

    /**
     * 将double 数值固定两位
     * @param money
     * @return
     */
    public static final String formatMoney(Double money){
        if(money == null) return "非法格式";
        DecimalFormat df = new DecimalFormat("#.00");
        return df.format(money);
    }
}
