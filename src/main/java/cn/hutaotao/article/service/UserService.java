package cn.hutaotao.article.service;

import cn.hutaotao.article.exception.MyUserException;
import cn.hutaotao.article.model.User;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ht on 2017/9/18.
 */
public interface UserService {
    /**
     * 根据 id 查询
     *
     * @param id
     * @return
     */
    User findUserById(String id);

    /**
     * 根据 username 查询
     *
     * @param username
     * @return
     */
    User findUserByUsername(String username);

    /**
     * 保存用户
     *
     * @param user
     */
    void saveUser(User user);

    User updateUserWithState(User user);

    User updateUserWithLogged(User user, long currentTime);

    /**
     * 注册用户
     * 注意：
     * 添加UUID
     * 密码加密
     * 初始化创建时间
     * 设置 logger 为空
     * 初始化状态
     *
     * @param user
     */
    void registerUser(User user) throws MyUserException;

    /**
     * 登录方法
     * 注意：
     * 1.通过 username 查询用户
     * 2.通过用户 比对密码
     * 2.1 判断 logged 是否已记录
     * 3.记录异常
     *
     * @param user
     * @param request
     */
    User loginByUsernameAndPwd(User user, HttpServletRequest request);

    /**
     * 根据激活码激活用户
     *
     * @param code
     * @return
     */
    User activateUser(String code);
}
