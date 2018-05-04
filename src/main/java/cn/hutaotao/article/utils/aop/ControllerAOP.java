package cn.hutaotao.article.utils.aop;

import cn.hutaotao.article.utils.exception.CheckException;
import cn.hutaotao.article.utils.exception.NoPermissionException;
import cn.hutaotao.article.utils.exception.UnloginException;
import cn.hutaotao.article.model.custom.ResultBean;
import lombok.extern.log4j.Log4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by ht on 2018/3/25.
 * ControllerAop 使用AOP做统一异常处理
 *
 * @author ht
 */
@Log4j
public class ControllerAOP {
    private static final Logger logger = LoggerFactory.getLogger(ControllerAOP.class);

    public Object handlerControllerMethod(ProceedingJoinPoint point) {
        long startTime = System.currentTimeMillis();

        ResultBean<?> result;

        try {
            result = (ResultBean<?>) point.proceed();
            logger.info(point.getSignature() + "use time:" + (System.currentTimeMillis() - startTime));
        } catch (Throwable e) {
            result = handlerException(point, e);
        }

        return result;
    }

    private ResultBean<?> handlerException(ProceedingJoinPoint point, Throwable e) {
        ResultBean<?> result = new ResultBean();

        // 已知异常
        if (e instanceof CheckException) {
            result.setMsg(e.getLocalizedMessage());
            result.setCode(ResultBean.FAIL);
        } else if (e instanceof UnloginException) {
            result.setMsg("未登录，请重新登录");
            result.setCode(ResultBean.NO_LOGIN);
        } else if (e instanceof NoPermissionException) {
            result.setMsg("未授权");
            result.setCode(ResultBean.NO_PERMISSION);
        } else {
            log.error(point.getSignature() + " error ", e);
            //TODO 未知的异常，发送邮件通知
            result.setMsg(e.toString());
            result.setCode(ResultBean.FAIL);
        }

        return result;
    }
}
