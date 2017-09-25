package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.Tag;

public interface TagMapper {
    int deleteByPrimaryKey(String tagid);

    int insert(Tag record);

    int insertSelective(Tag record);

    Tag selectByPrimaryKey(String tagid);

    int updateByPrimaryKeySelective(Tag record);

    int updateByPrimaryKey(Tag record);
}
