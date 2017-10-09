package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.User;
import org.springframework.web.bind.annotation.PathVariable;

public interface UserMapper {
    int deleteByPrimaryKey(String uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String uid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByUsername(String username);

    User selectByActivateCode(String activateCode);

    void updateWordNumber(@PathVariable String uid, @PathVariable Integer wordNumber);
}