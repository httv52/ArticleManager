package cn.hutaotao.article.exception;

/**
 * 未登录异常
 * Created by ht on 2018/3/25.
 *
 * @author ht
 */
public class UnloginException extends RuntimeException {
    public UnloginException() {
        super();
    }

    public UnloginException(String message) {
        super(message);
    }

    public UnloginException(String message, Throwable cause) {
        super(message, cause);
    }

    public UnloginException(Throwable cause) {
        super(cause);
    }

    protected UnloginException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
