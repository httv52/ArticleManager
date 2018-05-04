package cn.hutaotao.article.utils.exception;

/**
 * 校验异常
 * Created by ht on 2018/3/25.
 *
 * @author ht
 */
public class CheckException extends RuntimeException {
    public CheckException() {
        super();
    }

    public CheckException(String message) {
        super(message);
    }

    public CheckException(String message, Throwable cause) {
        super(message, cause);
    }

    public CheckException(Throwable cause) {
        super(cause);
    }

    protected CheckException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
