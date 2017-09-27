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
        if (suffix.equalsIgnoreCase(".png") || suffix.equalsIgnoreCase(".jpg") ||
                suffix.equalsIgnoreCase(".jpeg") || suffix.equalsIgnoreCase(".bmp") ||
                suffix.equalsIgnoreCase("gif")) {
            return File.FILE_TYPEE_IMAGE;
        }
        if (suffix.equalsIgnoreCase(".txt") || suffix.equalsIgnoreCase(".css") ||
                suffix.equalsIgnoreCase(".js") || suffix.equalsIgnoreCase(".doc")) {
            return File.FILE_TYPEE_TEXT;
        }
        if (suffix.equalsIgnoreCase(".html") || suffix.equalsIgnoreCase(".htm") ||
                suffix.equalsIgnoreCase(".jsp") || suffix.equalsIgnoreCase(".php") ||
                suffix.equalsIgnoreCase(".do") || suffix.equalsIgnoreCase(".html")) {
            return File.FILE_TYPEE_LINK;
        }
        if (suffix.equalsIgnoreCase(".avi") || suffix.equalsIgnoreCase(".mp4") ||
                suffix.equalsIgnoreCase(".rm") || suffix.equalsIgnoreCase(".mov") ||
                suffix.equalsIgnoreCase(".mpg") || suffix.equalsIgnoreCase(".mpg4")) {
            return File.FILE_TYPEE_VEDIO;
        }
        if (suffix.equalsIgnoreCase(".mp3") || suffix.equalsIgnoreCase(".ram") ||
                suffix.equalsIgnoreCase(".wav") || suffix.equalsIgnoreCase(".wma") ||
                suffix.equalsIgnoreCase(".amr") || suffix.equalsIgnoreCase(".ram")) {
            return File.FILE_TYPEE_MUSIC;
        }
        return File.FILE_TYPEE_OTHER;
    }
}
