package cn.hutaotao.article.utils.code;

import cn.hutaotao.article.model.Article;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

import java.util.Random;

/**
 * UUIDUtil Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>09/19/2017</pre>
 */
public class UUIDUtilTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: getUUID()
     */
    @Test
    public void testGetUUID() throws Exception {
        System.out.println(UUIDUtil.getUUID());
    }


    @Test
    public void getUUID_12Test() {
        System.out.println(UUIDUtil.getUUID_12());
    }

    @Test
    public void test() {
//        int max = 20;
//        int min = 0;
//        Random random = new Random();
//
//        for (int i = 0; i < 1000; i++) {
//            int s = random.nextInt(max) % (max - min + 1) + min;
//            if (s == 0) {
//                System.out.println(s);
//            }
//        }
        Article article = new Article();
        article.setContent("1234556及纳税会计多啊    。爱的莫阿贾克斯噢登进我");
        System.out.println(Long.valueOf(article.getContent().trim().length()));
    }
}
