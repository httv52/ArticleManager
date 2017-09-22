package cn.hutaotao.article.service;

import cn.hutaotao.article.model.User;
import cn.hutaotao.article.model.custom.UserCustom;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ht on 2017/9/20.
 */
public interface LogsService {
    /**
     * 保存日志
     * @param userCustom
     * @param request
     * @param logAction
     * @param data
     * @param currentTime
     */
    void savaLogs(UserCustom userCustom, HttpServletRequest request, String logAction, String data, long currentTime) throws Exception;
}
