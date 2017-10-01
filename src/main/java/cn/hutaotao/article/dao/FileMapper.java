package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.File;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FileMapper {
    void saveFile(File file);

    Integer findFileCount(String uid);

    List<File> findAllFileByUser(@Param("uid") String uid, @Param("pageNow") Integer pageNow,
                                 @Param("pageSize") Integer pageSize, @Param("type") Integer fileType);

    /**
     * 通过用户和文件类型查询文件数量
     *
     * @param uid
     * @param type
     * @return
     */
    Integer findFileCountByType(@Param("uid") String uid, @Param("type") Integer type);

    List<File> findFileGroupByType(String uid);

    void deleteFileById(String fileId);
}