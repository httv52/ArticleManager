package cn.hutaotao.article.utils.format;

import org.junit.Test;

import java.util.Date;

import static org.junit.Assert.*;

/**
 * Created by ht on 2017/9/23.
 */
public class FormatUtilTest {
    @Test
    public void formatDate() throws Exception {
    }

    @Test
    public void formatDateTime() throws Exception {
        System.out.println(FormatUtil.formatDateTime(1505970482127L));
    }

    @Test
    public void getNewFileName() throws Exception {
        System.out.println(FormatUtil.getNewFileName());
    }

    @Test
    public void test() {
        int a = 10;
        System.out.println(a/2);
        System.out.println(a-(a/2)-1);
    }

}