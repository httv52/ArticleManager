package cn.hutaotao.article.utils.format;

import java.util.Random;

/**
 * Created by ht on 2017/10/9.
 */
public class ImgUtil {
    /**
     * 前缀名
     */
    private static final String PREFIX = "/img/";

    /**
     * 返回 一个范围的随机数
     *
     * @return
     */
    public static Integer randomNumber(Integer min, Integer max) {
        Random random = new Random();

        int randomNumber = random.nextInt(max) % (max - min + 1) + min;

        return randomNumber;
    }

    /**
     * 分类小图标
     *
     * @return
     */
    public static String categoryImg() {
        return PREFIX + "icon_" + randomNumber(0, 40) + ".png";
    }

    /**
     * 文章默认预览图
     *
     * @return
     */
    public static String articleImg() {
        return PREFIX + "article_img_" + randomNumber(0, 50) + ".jpeg";
    }
}
