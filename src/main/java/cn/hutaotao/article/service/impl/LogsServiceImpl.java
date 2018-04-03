package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.LogsMapper;
import cn.hutaotao.article.model.Logs;
import cn.hutaotao.article.model.custom.UserCustom;
import cn.hutaotao.article.service.LogsService;
import cn.hutaotao.article.utils.format.LogDataUtil;
import cn.hutaotao.article.utils.other.IPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ht on 2017/9/20.
 */
@Service
public class LogsServiceImpl implements LogsService {
    @Autowired
    LogsMapper logsMapper;

    @Override
    public void savaLogs(UserCustom userCustom, HttpServletRequest request, String logAction, String data, long currentTime) throws Exception {
        Logs logs = new Logs();
        logs.setAction(logAction);
        logs.setData(data);
        logs.setUid(userCustom.getUid());
        logs.setIp(IPUtil.getIpAddr(request));
        logs.setCreatrd(currentTime);

        logsMapper.insert(logs);
    }

    @Override
    public List<Logs> findAll(String loginUserId, Integer limit) {
        return logsMapper.findAllLogs(loginUserId, limit);
    }
}
