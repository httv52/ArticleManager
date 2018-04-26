package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.UserMapper;
import cn.hutaotao.article.exception.CheckException;
import cn.hutaotao.article.exception.MyException;
import cn.hutaotao.article.model.*;
import cn.hutaotao.article.model.custom.UserCustom;
import cn.hutaotao.article.service.ArticleService;
import cn.hutaotao.article.service.LogsService;
import cn.hutaotao.article.service.ThemeService;
import cn.hutaotao.article.service.UserService;
import cn.hutaotao.article.utils.article.ArticleUtil;
import cn.hutaotao.article.utils.cache.MapCache;
import cn.hutaotao.article.utils.code.UUIDUtil;
import cn.hutaotao.article.utils.format.ImgUtil;
import cn.hutaotao.article.utils.format.LogDataUtil;
import cn.hutaotao.article.utils.format.MyMD5Utils;
import lombok.extern.log4j.Log4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ht on 2017/9/18.
 */
@Service
@Log4j
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private LogsService logsService;
    @Autowired
    private ThemeService themeService;
    @Autowired
    private ArticleService articleService;

    @Override
    public User findUserById(String id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public User findUserByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public void saveUser(User user) {
        userMapper.insert(user);
    }

    @Override
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
    @Override
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
    @Override
    public void updateRegisterUser(User user) throws MyException {
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
     */
    @Override
    public User selectLoginByUsernameAndPwd(User user) {
        User tempUser = userMapper.selectByUsername(user.getUsername());
        //若未查出，抛出异常
        if (null == tempUser) {
            throw new MyException("登录失败-密码或用户名错误");
        }

        if (tempUser.getState() == 0) {
            throw new CheckException("你尚未激活，请前往邮箱 " + tempUser.getEmail() + " 激活。");
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
     * <p>
     * 插入初始化数据
     *
     * @param code
     * @return
     */
    @Override
    public User updateActivateUser(String code, String ipAddr) {
        User user = userMapper.selectByActivateCode(code);
        if (null == user) {
            throw new MyException("激活码不存在");
        }

        if (1 == user.getState()) {
            throw new MyException("此账号已被激活，请登录");
        }

        user = updateUserWithState(user);

        //插入主题
        Theme theme = new Theme();
        theme.setId(UUIDUtil.getUUID());
        theme.setAutherName(user.getScreenName() + "的博客");
        theme.setKeyword("博客");
        theme.setDescribe(user.getScreenName() + "的博客");
        theme.setQrType(1);
        theme.setUser(user);
        themeService.insertTheme(theme);

        //插入初始化文章
        Article article = new Article();
        article.setTitle("我的第一篇文章");
        article.setPageTitle("我的第一篇文章");
        article.setContent("## Hello  World.\n" +
                "\n" +
                "> 第一篇文章总得写点儿什么?...\n" +
                "\n" +
                "----------\n" +
                "\n" +
                "\n" +
                "<!--more-->\n" +
                "\n" +
                "```js\n" +
                "public static void main(String[] args){\n" +
                "    System.out.println(\"Hello World.\");\n" +
                "}\n" +
                "```\n");
        article.setPreviewimg(ImgUtil.articleImg());
        article.setAllowcommon(1);
        article.setAllowPreview(1);
        article.setAllowsub(1);
        article.setType(0);
        article.setState(1);
        Category category = new Category();
        category.setCategoryid(Category.DEFAULT_THEME);
        article.setCategory(category);

        articleService.saveOrUpdateArticle(null, null, Category.DEFAULT_THEME, article, user, ipAddr);

        return user;
    }

    @Override
    public User updateUserInfo(String screenName, String email, String loginUserId) {
        if (StringUtils.isBlank(screenName) || StringUtils.isBlank(email)) {
            throw new MyException("信息不能为空");
        }

        User user = new User();
        user.setUid(loginUserId);
        user.setScreenName(screenName);
        user.setEmail(email);
        userMapper.updateByPrimaryKeySelective(user);
        return findUserById(user.getUid());
    }

    @Override
    public void updatePassword(String oldPwd, String newPwd, String loginUserId) {
        if (StringUtils.isBlank(oldPwd) || StringUtils.isBlank(newPwd)) {
            throw new MyException("密码不能为空");
        }

        User user = findUserById(loginUserId);
        //若对比错误，抛出异常
        if (!user.getPassword().equalsIgnoreCase(MyMD5Utils.getMD5(oldPwd))) { //忽略md5大小写
            throw new MyException("密码错误,请重填");
        }

        User newUser = new User();
        newUser.setUid(user.getUid());
        newUser.setPassword(MyMD5Utils.getMD5(newPwd));

        userMapper.updateByPrimaryKeySelective(newUser);
    }


    /**
     * 登陆错误次数的缓存
     */
    protected MapCache cache = MapCache.single();
    /**
     * 登陆错误次数
     */
    protected static final String LOGIN_ERROR_COUNT = "login_error_count";

    @Override
    public void updateLogin(UserCustom user, BindingResult bindingResult, HttpSession session, String ipAddr) {
        //校验数据
        if (bindingResult.hasErrors()) {
            List<ObjectError> errorList = bindingResult.getAllErrors();
            String error_msg = "";
            for (ObjectError objectError : errorList) {
                error_msg = objectError.getDefaultMessage();
            }
            throw new CheckException(error_msg);
        }

        Integer error_count = cache.get(user.getUsername() + "_" + LOGIN_ERROR_COUNT);

        try {
            //判断error_count是否为空
            error_count = null == error_count ? 0 : error_count;


            if (error_count >= 3) {//错误超过三次
                throw new CheckException("登录失败-失败次数超过限制,请10分钟后再登陆");
            }

            User sessionUser = selectLoginByUsernameAndPwd(user);

            //判断 loged 是否初始化，若未，则初始化并记录日志
            long currentTime = System.currentTimeMillis();
            user.setUid(sessionUser.getUid());
            if (null == sessionUser.getLogged()) {
                sessionUser = updateUserWithLogged(sessionUser, currentTime);
                //记录初始化日志
                logsService.saveLogs(user, ipAddr, Logs.INIT_LOG, LogDataUtil.userInitDate(user), currentTime);
                //记录日志
                logsService.saveLogs(user, ipAddr, Logs.LOGIN_LOG, LogDataUtil.userLogData(user), System.currentTimeMillis());
            } else {
                //记录日志
                logsService.saveLogs(user, ipAddr, Logs.LOGIN_LOG, LogDataUtil.userLogData(user), currentTime);
            }

            //清空登陆错误缓存
            cache.set(user.getUsername() + "_" + LOGIN_ERROR_COUNT, 0);

            //保存到session
            session.setAttribute(cn.hutaotao.article.model.User.SESSION_USER_NAME, sessionUser);

        } catch (MyException e) {
            error_count += 1;
            cache.set(user.getUsername() + "_" + LOGIN_ERROR_COUNT, error_count, 10);//10 * 60
            log.error(e.getStackTrace());
            throw new CheckException(e.getMessage());
        }
    }
}
