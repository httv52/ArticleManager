package cn.hutaotao.article.utils.code;

import org.junit.Test;
import org.junit.Before;
import org.junit.After;

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
    public void test() {
        System.out.println(System.currentTimeMillis());
    }
} 
