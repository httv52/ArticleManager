package cn.hutaotao.article.utils.message;

import io.goeasy.GoEasy;
import io.goeasy.publish.GoEasyError;
import io.goeasy.publish.PublishListener;
import lombok.extern.log4j.Log4j;

/**
 * Created by ht on 2018/4/25.
 *
 * @author ht
 */
@Log4j
public class GoEasyUtils {
    public static final String REGIONHOST = "rest-hangzhou.goeasy.io";
    public static final String APP_KAY = "BC-3dd1d68ec2a44756b728ff9f840a9c76";

    public static void sendMessage(String channel, String content) {
        GoEasy goEasy = new GoEasy(REGIONHOST, APP_KAY);
        goEasy.publish(channel, content, new PublishListener() {
            @Override
            public void onFailed(GoEasyError error) {
                System.out.println("推送失败，Error code:" + error.getCode() + "; error content:" + error.getContent());
                log.error("推送失败，Error code:" + error.getCode() + "; error content:" + error.getContent());
            }

            @Override
            public void onSuccess() {
                System.out.println("推送成功");
                log.info("推送成功");
            }
        });
    }
}
