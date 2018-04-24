package cn.hutaotao.article.service;

import cn.hutaotao.article.model.Logs;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.model.custom.CountInfoBean;

import java.util.List;

/**
 * Created by ht on 2017/9/20.
 */
public interface LogsService {
    /**
     * 保存日志
     *
     * @param userCustom
     * @param ipAddr
     * @param logAction
     * @param data
     * @param currentTime
     */
    void saveLogs(User userCustom, String ipAddr, String logAction, String data, long currentTime);

    /**
     * 获取所有日志
     *
     * @param loginUserId 用户
     * @return
     */
    List<Logs> findAll(String loginUserId, Integer limit);

    /**
     * 查询日志统计信息
     * @param uid
     * @return
     */
    List<CountInfoBean> findLogsInfo(String uid);

    /**
     * 查询分类统计信息
     * @param uid
     * @return
     */
    List<CountInfoBean> findCategoryInfo(String uid);
}
