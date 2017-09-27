package cn.hutaotao.article.utils.other;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ht on 2017/9/20.
 */
public class IPUtil {
    /**
     * 获取 IP 地址
     *
     * @param request
     * @return
     * @throws Exception
     */
    public static String getIpAddr(HttpServletRequest request) throws Exception {
        String ip = request.getHeader("X-Real-IP");
        if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
            return ipHelper(ip);
        }
        ip = request.getHeader("X-Forwarded-For");
        if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
            // 多次反向代理后会有多个IP值，第一个为真实IP。
            int index = ip.indexOf(',');
            if (index != -1) {
                String realIp = ip.substring(0, index);
                return ipHelper(realIp);
            } else {
                return ipHelper(ip);
            }
        } else {
            return ipHelper(request.getRemoteAddr());
        }
    }

    private static String ipHelper(String realIp) {
        if ("0:0:0:0:0:0:0:1".equalsIgnoreCase(realIp)) {
            return "127.0.0.1";
        } else {
            return realIp;
        }
    }
}
