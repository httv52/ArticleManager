package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.User;
import org.apache.ibatis.annotations.Param;


public interface UserMapper {
    int deleteByPrimaryKey(String uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String uid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByUsername(String username);

    User selectByActivateCode(String activateCode);

    void updateWordNumber(@Param("uid") String uid, @Param("wordNumber") Integer wordNumber);
}