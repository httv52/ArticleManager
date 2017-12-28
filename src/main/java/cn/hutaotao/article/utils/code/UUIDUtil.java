package cn.hutaotao.article.utils.code;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * 生成 UUID
 * <p>
 * Created by ht on 2017/9/19.
 */
public class UUIDUtil {
    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }


    public static int serNum = 1;  //初始值
    public static int len = 4;      //最多添加四个0
    private static final byte[] ZEROS = {48, 48, 48, 48, 48};  //0的ascii码


    /**
     * 12位不重复uuid
     * <p>
     * 170923  0001
     * 65e0c7b1
     * 65e0c7b1  34ae
     *
     * @return
     */
    public static String getUUID_12() {
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyMMdd");
        String fir = dateFormat.format(date);
        int num = serNum++;
        int len2 = (num + "").length();
        String sec = new String(ZEROS, 0, len - len2);
//        System.out.println(new Long(fir + sec + num));
//        System.out.println(Long.toHexString(new Long(fir + sec + num)));
        return (Long.toHexString(new Long(fir + sec + num)) + getUUID().substring(0, 4)).toLowerCase();
    }


}
