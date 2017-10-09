package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.UserMapper;
import cn.hutaotao.article.exception.MyException;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.service.LogsService;
import cn.hutaotao.article.service.UserService;
import cn.hutaotao.article.utils.code.UUIDUtil;
import cn.hutaotao.article.utils.format.MyMD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ht on 2017/9/18.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private LogsService logsService;

    public User findUserById(String id) {
        return userMapper.selectByPrimaryKey(id);
    }

    public User findUserByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    public void saveUser(User user) {
        userMapper.insert(user);
    }

    public User updateUserWithState(User user) {
        User newUser = userMapper.selectByPrimaryKey(user.getUid());

        newUser.setState(1);

        //更新Logged
        userMapper.updateByPrimaryKey(newUser);

        return userMapper.selectByPrimaryKey(user.getUid());
    }

    /**
     * 初始化用户 Logged
     *
     * @param user
     * @param currentTime
     */
    public User updateUserWithLogged(User user, long currentTime) {
        User newUser = userMapper.selectByPrimaryKey(user.getUid());

        newUser.setLogged(currentTime);

        //更新Logged
        userMapper.updateByPrimaryKey(newUser);

        return userMapper.selectByPrimaryKey(user.getUid());
    }

    /**
     * 添加UUID
     * 密码加密
     * 初始化创建时间
     * 设置 logger 为空
     * 初始化状态
     *
     * @param user
     */
    public void registerUser(User user) throws MyException {
        //首先判断用户名是否已被注册
        //若已被注册，抛出异常
        if (findUserByUsername(user.getUsername()) != null) {
            throw new MyException("该用户名已被注册，请更换用户名");
        }

        user.setUid(UUIDUtil.getUUID());  //uuid
        user.setPassword(MyMD5Utils.getMD5(user.getPassword()));  //密码md5加密
        user.setCreated(System.currentTimeMillis());  //创建时间
        user.setLogged(null);
        user.setActivateCode(user.getActivateCode());//激活码
        user.setResume("暂无简介");
        user.setWordNumber(0);
        user.setState(User.USER_STATE_OF__LOSE_ACTIVATE);

        saveUser(user);  //保存用户
    }

    /**
     * 登录方法
     * 思路：
     * 首先根据 username查询用户
     * 若未查出，抛出异常
     * 若查出，继续
     * 先检查是否已被激活，再根据查出的用户，对比密码（md5）
     * 若对比错误，抛出异常
     * 若正确，继续
     * 判断 loged 是否初始化，若为，则初始化
     *
     * @param user
     * @param request
     */
    @Override
    public User loginByUsernameAndPwd(User user, HttpServletRequest request) {
        User tempUser = userMapper.selectByUsername(user.getUsername());
        //若未查出，抛出异常
        if (null == tempUser) {
            throw new MyException("登录失败-密码或用户名错误");
        }

        if (tempUser.getState() == 0) {
            throw new MyException("你尚未激活，请前往邮箱 " + tempUser.getEmail() + " 激活。");
        }

        String md5_dbPwd = tempUser.getPassword();  //数据库密码加密
        String md5_inputPwd = MyMD5Utils.getMD5(user.getPassword());  //输入密码加密

        //若对比错误，抛出异常
        if (!md5_dbPwd.equalsIgnoreCase(md5_inputPwd)) { //忽略md5大小写
            throw new MyException("登录失败-密码或用户名错误");
        }

        return tempUser;
    }

    /**
     * 首先根据激活码查询用户
     * 若激活码不存在，抛出异常
     * 若激活状态为1，说明已被激活，抛出异常
     * 否则激活用户，改变激活状态码
     *
     * @param code
     * @return
     */
    @Override
    public User activateUser(String code) {
        User user = userMapper.selectByActivateCode(code);
        if (null == user) {
            throw new MyException("激活码不存在");
        }

        if (1 == user.getState()) {
            throw new MyException("此账号已被激活，请登录");
        }

        user = updateUserWithState(user);

        return user;
    }
}
