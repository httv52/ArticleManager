package cn.hutaotao.article.utils.format;

import cn.hutaotao.article.model.File;
import org.apache.commons.lang3.StringUtils;

/**
 * Created by ht on 2017/9/26.
 */
public class FileSuffixUtil {
    public static Integer getTypeOfSuffix(String suffix) {
        if (!StringUtils.isNotBlank(suffix)) {
            return File.FILE_TYPEE_OTHER;
        }
        suffix = suffix.trim();
        if (".png".equalsIgnoreCase(suffix) || ".jpg".equalsIgnoreCase(suffix) ||
                ".jpeg".equalsIgnoreCase(suffix) || ".bmp".equalsIgnoreCase(suffix) ||
                "gif".equalsIgnoreCase(suffix) || ".ico".equalsIgnoreCase(suffix)) {
            return File.FILE_TYPEE_IMAGE;
        }
        if (".txt".equalsIgnoreCase(suffix) || ".css".equalsIgnoreCase(suffix) ||
                ".js".equalsIgnoreCase(suffix) || ".doc".equalsIgnoreCase(suffix)) {
            return File.FILE_TYPEE_TEXT;
        }
        if (".html".equalsIgnoreCase(suffix) || ".htm".equalsIgnoreCase(suffix) ||
                ".jsp".equalsIgnoreCase(suffix) || ".php".equalsIgnoreCase(suffix) ||
                ".do".equalsIgnoreCase(suffix) || ".html".equalsIgnoreCase(suffix)) {
            return File.FILE_TYPEE_LINK;
        }
        if (".avi".equalsIgnoreCase(suffix) || ".mp4".equalsIgnoreCase(suffix) ||
                ".rm".equalsIgnoreCase(suffix) || ".mov".equalsIgnoreCase(suffix) ||
                ".mpg".equalsIgnoreCase(suffix) || ".mpg4".equalsIgnoreCase(suffix)) {
            return File.FILE_TYPEE_VEDIO;
        }
        if (".mp3".equalsIgnoreCase(suffix) || ".ram".equalsIgnoreCase(suffix) ||
                ".wav".equalsIgnoreCase(suffix) || ".wma".equalsIgnoreCase(suffix) ||
                ".amr".equalsIgnoreCase(suffix) || ".ram".equalsIgnoreCase(suffix)) {
            return File.FILE_TYPEE_MUSIC;
        }
        return File.FILE_TYPEE_OTHER;
    }
}
