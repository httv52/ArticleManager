package cn.hutaotao.article.exception;

/**
 * 自定义异常
 * Created by ht on 2017/9/19.
 */
public class MyUserException extends RuntimeException {
    public MyUserException() {
        super();
    }

    public MyUserException(String message) {
        super(message);
    }

    public MyUserException(String message, Throwable cause) {
        super(message, cause);
    }

    public MyUserException(Throwable cause) {
        super(cause);
    }
}
