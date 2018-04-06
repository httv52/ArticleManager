package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.LogsMapper;
import cn.hutaotao.article.model.Logs;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.model.custom.UserCustom;
import cn.hutaotao.article.service.LogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ht on 2017/9/20.
 */
@Service
public class LogsServiceImpl implements LogsService {
    @Autowired
    LogsMapper logsMapper;

    @Override
    public void saveLogs(User user, String ipAddr, String logAction, String data, long currentTime) {
        Logs logs = new Logs();
        logs.setAction(logAction);
        logs.setData(data);
        logs.setUid(user.getUid());
        logs.setIp(ipAddr);
        logs.setCreatrd(currentTime);

        logsMapper.insert(logs);
    }

    @Override
    public List<Logs> findAll(String loginUserId, Integer limit) {
        return logsMapper.findAllLogs(loginUserId, limit);
    }
}
