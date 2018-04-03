package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.Logs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LogsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Logs record);

    int insertSelective(Logs record);

    Logs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Logs record);

    int updateByPrimaryKey(Logs record);

    List<Logs> findAllLogs(@Param("uid")String uid, @Param("limit")Integer limit);
}