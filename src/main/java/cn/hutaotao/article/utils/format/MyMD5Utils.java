package cn.hutaotao.article.utils.format;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by ht on 2017/7/19.
 */
public class MyMD5Utils {
    public static String getMD5(String plainText) {
        if (plainText == null) {
            return "";
        }

        byte [] secretBytes = null;
        try{
            secretBytes = MessageDigest.getInstance("md5").digest(plainText.getBytes());
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MD5加密错误错误");
        }

        String md5Code = new BigInteger(1, secretBytes).toString(16);  //16进制

        //不够32位的，补0
        for (int i = 0; i < 32 - md5Code.length(); i++) {
            md5Code = "0" + md5Code;
        }

        return md5Code;
    }

}
