package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.File;

public interface FileMapper {
    void saveFile(File file);

    Integer findFileCount(String uid);
    /*int deleteByPrimaryKey(String id);

    int insert(File record);

    int insertSelective(File record);

    File selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(File record);

    int updateByPrimaryKey(File record);*/
}