package cn.hutaotao.article.utils.aop;

import cn.hutaotao.article.exception.MyException;
import cn.hutaotao.article.model.custom.ResultBean;
import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by ht on 2018/3/25.
 * ControllerAop 使用AOP做统一异常处理
 *
 * @author ht
 */
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
        if (e instanceof MyException) {
            result.setMsg(e.getLocalizedMessage());
            result.setCode(ResultBean.FAIL);
        } /*else if (e instanceof UnloginException) {
            result.setMsg("Unlogin");
            result.setCode(ResultBean.NO_LOGIN);
        }*/ else {
            logger.error(point.getSignature() + " error ", e);
            //TODO 未知的异常，发送邮件通知
            result.setMsg(e.toString());
            result.setCode(ResultBean.FAIL);
        }

        return result;
    }
}
