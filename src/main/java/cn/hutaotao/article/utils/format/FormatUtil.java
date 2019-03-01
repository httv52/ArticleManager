package cn.hutaotao.article.utils.format;

import javax.validation.constraints.Size;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

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
    public static final String formatDate(Long time) {
        if (time == null) {
            return "";
        }
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(new Date(time));
    }

    /**
     * HH:mm:ss --->24小时制
     *
     * @param time
     * @return
     */
    public static final String formatTime(Long time) {
        if (time == null) {
            return "";
        }
        DateFormat df = new SimpleDateFormat("HH:mm:ss");
        return df.format(new Date(time));
    }


    /**
     * yyyy-MM-dd HH:mm:ss --->24小时制
     *
     * @param time
     * @return
     */
    public static final String formatDateTime(Long time) {
        if (time == null) {
            return "";
        }
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return df.format(new Date(time));
    }

    /**
     * 将double 数值固定两位
     *
     * @param money
     * @return
     */
    public static final String formatMoney(Double money) {
        if (money == null) {
            return "非法格式";
        }
        DecimalFormat df = new DecimalFormat("#.00");
        return df.format(money);
    }

    public static String getNewFileName() {
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String newFileName = format.format(new Date());

        Random r = new Random();

        for (int i = 0; i < 6; i++) {
            newFileName = newFileName + r.nextInt(10);
        }

        return newFileName;
    }

    /**
     * 格式化文件大小
     *
     * @param fileSize 文件大小，初始为B
     */
    public static String formatFileSize(Long fileSize) {
        if (fileSize == null || fileSize <= 0) {
            return "未知大小";
        }

        Double size = new Double(fileSize);

        //如果字节数少于1024，则直接以B为单位，否则先除于1024，后3位因太少无意义
        if (size < 1024) {
            return String.valueOf(size) + "B";
        } else {
            size = DataUtils.divide(size, 1024D, 2);
        }
        //如果原字节数除于1024之后，少于1024，则可以直接以KB作为单位
        //因为还没有到达要使用另一个单位的时候
        //接下去以此类推
        if (size < 1024) {
            return String.valueOf(size) + "KB";
        } else {
            size = DataUtils.divide(size, 1024D, 2);
        }

        if (size < 1024) {
            //因为如果以MB为单位的话，要保留最后1位小数，
            //因此，把此数乘以100之后再取余
            size = size * 100;
            return String.valueOf(DataUtils.divide(size, 100, 2)) + "MB";
        } else {
            //否则如果要以GB为单位的，先除于1024再作同样的处理
            size = size * 100 / 1024;
            return String.valueOf(DataUtils.divide(size, 100, 2)) + "GB";
        }
    }
}
