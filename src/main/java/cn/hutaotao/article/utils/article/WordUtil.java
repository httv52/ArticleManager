package cn.hutaotao.article.utils.article;

import cn.hutaotao.article.utils.exception.MyException;
import lombok.extern.log4j.Log4j;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.IOException;
import java.io.StringReader;
import java.util.*;
import java.util.Map.Entry;

/**
 * 获取文章关键字
 *
 * @author anwj
 */
@Log4j
public class WordUtil {

    /**
     * 默认取关键字个数
     */
    public final static Integer DEFAULT_KEY_WOLD_LENGTH = 10;
    /**
     * 不限制关键字个数
     */
    public final static Integer MAX_KEY_WOLD_LENGTH = -1;
    /**
     * 截取关键字在几个单词以上的数量
     */
    private final static Integer QUANTITY = 1;

    /**
     * 传入String类型的文章，智能提取单词放入list中
     *
     * @param article
     * @param a
     * @return
     * @throws IOException
     */
    private static List<String> extract(String article, Integer a) throws IOException {
        List<String> list = new ArrayList<>();         //定义一个list来接收将要截取出来单词
        IKAnalyzer analyzer = new IKAnalyzer();             //初始化IKAnalyzer
        analyzer.setUseSmart(true);                         //将IKAnalyzer设置成智能截取
        TokenStream tokenStream =                            //调用tokenStream方法(读取文章的字符流)
                analyzer.tokenStream("", new StringReader(article));
        while (tokenStream.incrementToken()) {              //循环获得截取出来的单词
            CharTermAttribute charTermAttribute =           //转换为char类型
                    tokenStream.getAttribute(CharTermAttribute.class);
            String keWord = charTermAttribute.toString();    //转换为String类型
            if (keWord.length() > a) {                     //判断截取关键字在几个单词以上的数量(默认为2个单词以上)
                list.add(keWord);                           //将最终获得的单词放入list集合中
            }
        }
        return list;
    }

    /**
     * 将list中的集合转换成Map中的key，value为数量默认为1
     *
     * @param list
     * @return
     */
    private static Map<String, Integer> list2Map(List<String> list) {
        Map<String, Integer> map = new HashMap<>();
        for (String key : list) {                      //循环获得的List集合
            if (list.contains(key)) {              //判断这个集合中是否存在该字符串
                map.put(key, map.get(key) == null ? 1 : map.get(key) + 1);
            }                                       //将集中获得的字符串放在map的key键上
        }                                          //并计算其value是否有值，如有则+1操作
        return map;
    }

    /**
     * 提取关键字方法数组
     *
     * @param article 文章
     * @param length  关键字最大数量
     * @return 关键字方法数组
     * @throws IOException
     */
    public static String[] getKeyWordsArray(String article, Integer length) {
        Map<String, Integer> map = getKeyWordsMap(article);

        //使用Collections的比较方法进行对map中value的排序
        ArrayList<Entry<String, Integer>> list = new ArrayList<>(map.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                return (o2.getValue() - o1.getValue());
            }
        });

        //排序后的长度，以免获得到null的字符
        if (list.size() < length || length < 0) {
            length = list.size();
        }

        String[] keyWords = new String[length];                    //设置将要输出的关键字数组空间
        for (int i = 0; i < list.size(); i++) {                  //循环排序后的数组
            if (i < length) {                                       //判断个数
                keyWords[i] = list.get(i).getKey();           //设置关键字进入数组
            }
        }
        return keyWords;
    }

    /**
     * @param article
     * @return
     * @throws IOException
     */
    public static List<String> getKeyWords(String article, int length) {
        return Arrays.asList(getKeyWordsArray(article, length));
    }

    public static Map<String, Integer> getKeyWordsMap(String article) {
        List<String> keyWordsList;            //调用提取单词方法
        try {
            keyWordsList = extract(article, QUANTITY);
        } catch (IOException e) {
            log.error("提取关键字方法失败");
            e.printStackTrace();
            throw new MyException(e);
        }

        return list2Map(keyWordsList);
    }

    public static void main(String[] args) {
        String keyWord = "";
        List keywords = getKeyWords(keyWord, -1);
        for (Object keyword : keywords) {
            System.out.println(keyword);
        }
    }
}
