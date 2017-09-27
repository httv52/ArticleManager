package cn.hutaotao.article.exception;

/**
 * 自定义异常
 * Created by ht on 2017/9/19.
 */
public class MyException extends RuntimeException {
    public MyException() {
        super();
    }

    public MyException(String message) {
        super(message);
    }

    public MyException(String message, Throwable cause) {
        super(message, cause);
    }

    public MyException(Throwable cause) {
        super(cause);
    }
}
