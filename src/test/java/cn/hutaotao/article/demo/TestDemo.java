package cn.hutaotao.article.demo;

import org.junit.Test;

/**
 * Created by ht on 2017/9/20.
 */
public class TestDemo {
    @Test
    public void test() {
        String a = "11,22,33";
        String[] b = a.split(",");
        System.out.println(b);
    }
}
