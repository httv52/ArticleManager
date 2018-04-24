package cn.hutaotao.article.exception;

/**
 * 未授权异常
 * Created by ht on 2018/4/8.
 *
 * @author ht
 */
public class NoPermissionException extends RuntimeException {
    public NoPermissionException() {
        super();
    }

    public NoPermissionException(String message) {
        super(message);
    }

    public NoPermissionException(String message, Throwable cause) {
        super(message, cause);
    }

    public NoPermissionException(Throwable cause) {
        super(cause);
    }

    protected NoPermissionException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
