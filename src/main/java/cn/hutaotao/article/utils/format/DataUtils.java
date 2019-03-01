package cn.hutaotao.article.utils.format;

import cn.hutaotao.article.utils.exception.CheckException;
import org.apache.commons.lang3.StringUtils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 * 数据工具类
 * 主要用于获取特定信息、转化数据等
 * Created by ht on 2018/7/26.
 *
 * @author ht
 */
public class DataUtils {
    /**
     * double类型保留两位小数
     *
     * @param number 需要格式化的数字
     * @return 保留两位小数的double
     */
    public static Double getTwoDecimal(Double number) {
        DecimalFormat formatter = new DecimalFormat("#.00");
        return Double.valueOf(formatter.format(number));
    }

    /**
     * double类型保留指定位数小数
     *
     * @param number 需要格式化的数字
     * @param digits 位数
     * @return 保留两位小数的double
     */
    public static String formatNumberByDigits(Double number, Integer digits) {
        NumberFormat format = NumberFormat.getNumberInstance();
        format.setMaximumFractionDigits(digits);
        String strVale = format.format(number);
        int dot = strVale.lastIndexOf(',');
        if ((dot > -1) && (dot <= (strVale.length() - 1))) {
            strVale = strVale.replace(",", "");
        }
        return strVale;
    }

    //默认除法运算精度
    private static final int DEF_DIV_SCALE = 6;

    /**
     * 提供精确的加法运算。
     *
     * @param value1 被加数
     * @param value2 加数
     * @return 两个参数的和
     */
    public static double add(double value1, double value2) {
        BigDecimal b1 = new BigDecimal(Double.toString(value1));
        BigDecimal b2 = new BigDecimal(Double.toString(value2));
        return b1.add(b2).doubleValue();
    }

    /**
     * 提供精确的减法运算。
     *
     * @param value1 被减数
     * @param value2 减数
     * @return 两个参数的差
     */
    public static double sub(double value1, double value2) {
        BigDecimal b1 = new BigDecimal(Double.toString(value1));
        BigDecimal b2 = new BigDecimal(Double.toString(value2));
        return b1.subtract(b2).doubleValue();
    }

    /**
     * 提供精确的乘法运算。
     *
     * @param value1 被乘数
     * @param value2 乘数
     * @return 两个参数的积
     */
    public static double multiply(double value1, double value2) {
        BigDecimal b1 = new BigDecimal(Double.toString(value1));
        BigDecimal b2 = new BigDecimal(Double.toString(value2));
        return b1.multiply(b2).doubleValue();
    }

    /**
     * 提供（相对）精确的除法运算，当发生除不尽的情况时，精确到
     * 小数点以后10位，以后的数字四舍五入。
     *
     * @param value1 被除数
     * @param value2 除数
     * @return 两个参数的商
     */
    public static double divide(double value1, double value2) {
        return divide(value1, value2, DEF_DIV_SCALE);
    }

    /**
     * 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指
     * 定精度，以后的数字四舍五入。
     *
     * @param value1 被除数
     * @param value2 除数
     * @param scale  表示表示需要精确到小数点以后几位。
     * @return 两个参数的商
     */
    public static double divide(double value1, double value2, int scale) {
        if (scale < 0) {
            throw new CheckException("精度错误");
        }
        BigDecimal b1 = new BigDecimal(Double.toString(value1));
        BigDecimal b2 = new BigDecimal(Double.toString(value2));
        return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 提供精确的小数位四舍五入处理。
     *
     * @param v     需要四舍五入的数字
     * @param scale 小数点后保留几位
     * @return 四舍五入后的结果
     */
    public static double round(double v, int scale) {
        if (scale < 0) {
            throw new CheckException("精度错误");
        }
        BigDecimal b = new BigDecimal(Double.toString(v));
        BigDecimal one = new BigDecimal("1");
        return b.divide(one, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 判断一个字符是否是大写字母
     *
     * @param letter 待检验字符
     * @return true则符合
     */
    public static boolean isUppercaseLetter(String letter) {
        if (StringUtils.isBlank(letter) || letter.length() > 1) {
            return false;
        }

        if (Character.isUpperCase(letter.charAt(0))) {
            return true;
        }

        return false;
    }
}
