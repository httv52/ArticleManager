package cn.hutaotao.article.service;

import cn.hutaotao.article.model.File;
import cn.hutaotao.article.model.User;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * Created by ht on 2017/9/26.
 */
public interface FileService {
    String uploadFile(MultipartFile file, User user) throws Exception;

    void saveFile(File file);

    Integer findFileCount(String loginUserId);
}
