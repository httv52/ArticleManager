package cn.hutaotao.article.service;

import cn.hutaotao.article.model.File;
import cn.hutaotao.article.model.User;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by ht on 2017/9/26.
 */
public interface FileService {
    String uploadFile(MultipartFile file, User user) throws Exception;

    void saveFile(File file);

    Integer findFileCount(String loginUserId);

    List<File> findAllFileByUser(String loginUserId, Integer pageNow, Integer pageSize, Integer fileType);

    /**
     * 通过用户和文件类型查询文件数量
     *
     * @param loginUserId
     * @param type
     * @return
     */
    Integer findFileCountByType(String loginUserId, Integer type);

    /**
     * 分组查询所有文件类型
     *
     * @return
     */
    List<File> findFileGroupByType(String loginUserId);

    /**
     * 通过 id 删除文件
     * @param fileId
     * @return
     */
    String deleteFileById(String fileId);
}
