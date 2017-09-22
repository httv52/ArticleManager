package cn.hutaotao.article.utils.code;

import java.util.UUID;

/**
 * 生成 UUID
 *
 * Created by ht on 2017/9/19.
 */
public class UUIDUtil {
    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
