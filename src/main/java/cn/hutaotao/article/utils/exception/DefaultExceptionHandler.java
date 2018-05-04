/*
package cn.hutaotao.article.utils.exception;

import cn.hutaotao.article.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DefaultExceptionHandler implements HandlerExceptionResolver {
    private Logger log = BaseController.LOGGER;

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        ModelAndView mv = new ModelAndView();
            */
/*	使用response返回	*//*

//        response.setStatus(HttpStatus.OK.value()); //设置状态码
        response.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value()); //设置状态码
//        response.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE); //设置ContentType
//        response.setCharacterEncoding("UTF-8"); //避免乱码
//        response.setHeader("Cache-Control", "no-cache, must-revalidate");
        try {
            response.getWriter().write("{\"success\":false,\"msg\":\"" + ex.getMessage() + "\"}");
        } catch (IOException e) {
            log.error("与客户端通讯异常:" + e.getMessage(), e);
        }

        log.debug("异常:" + ex.getMessage(), ex);
        ex.printStackTrace();
        return mv;
    }
}*/
