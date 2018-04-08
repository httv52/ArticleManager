package cn.hutaotao.article.utils.filter;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Created by ht on 2018/4/8.
 *
 * @author ht
 */
public class CorsFilter implements Filter {
    private String allowOrigin;
    private String allowMethods;
    private String allowCredentials;
    private String allowHeaders;
    private String exposeHeaders;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        allowOrigin = filterConfig.getInitParameter("allowOrigin");
        allowMethods = filterConfig.getInitParameter("allowMethods");
        allowCredentials = filterConfig.getInitParameter("allowCredentials");
        allowHeaders = filterConfig.getInitParameter("allowHeaders");
        exposeHeaders = filterConfig.getInitParameter("exposeHeaders");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        if (StringUtils.isNotEmpty(allowOrigin)) {
            List<String> allowOriginList = Arrays.asList(allowOrigin.split(","));
            if (allowOriginList == null || allowOriginList.size() == 0) {
                String currentOrigin = req.getHeader("Origin");
                if (allowOriginList.contains(currentOrigin)) {
                    resp.setHeader("Access-Control-Allow-Origin", currentOrigin);
                }
            }
        }
        if (StringUtils.isNotEmpty(allowMethods)) {
            resp.setHeader("Access-Control-Allow-Methods", allowMethods);
        }
        if (StringUtils.isNotEmpty(allowCredentials)) {
            resp.setHeader("Access-Control-Allow-Credentials", allowCredentials);
        }
        if (StringUtils.isNotEmpty(allowHeaders)) {
            resp.setHeader("Access-Control-Allow-Headers", allowHeaders);
        }
        if (StringUtils.isNotEmpty(exposeHeaders)) {
            resp.setHeader("Access-Control-Expose-Headers", exposeHeaders);
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
