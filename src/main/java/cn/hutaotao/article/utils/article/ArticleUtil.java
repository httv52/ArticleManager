package cn.hutaotao.article.utils.article;

import com.vdurmont.emoji.EmojiParser;
import org.apache.commons.lang3.StringUtils;
import org.commonmark.Extension;
import org.commonmark.ext.autolink.AutolinkExtension;
import org.commonmark.ext.gfm.strikethrough.StrikethroughExtension;
import org.commonmark.ext.gfm.tables.TablesExtension;
import org.commonmark.node.Node;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;
import org.springframework.web.util.HtmlUtils;

import java.util.Arrays;
import java.util.List;

/**
 * Created by ht on 2017/10/9.
 */
public class ArticleUtil {
    private static final int ARTICLE_VIEW_LEN = 175;
    public static final int VIEW_TYPE_HAS_LEN = 1;
    public static final int VIEW_TYPE_NO_LEN = 0;


    /**
     * 这种格式的字符转换为emoji表情
     *
     * @param value
     * @return
     */
    public static String emoji(String value) {
        return EmojiParser.parseToUnicode(value);
    }

    /**
     * 显示文章内容，转换markdown为html
     *
     * @param value
     * @return
     */
    public static String articleToHtml(String value, int type) {
        if (StringUtils.isNotBlank(value)) {
            value = value.replace("<!--more-->", "\r\n");
            return mdToHtml(value, type);
        }
        return "";
    }

    /**
     * markdown转换为html
     *
     * @param markdown
     * @return
     */
    public static String mdToHtml(String markdown, int type) {
        if (StringUtils.isBlank(markdown)) {
            return "";
        }

        int pos = markdown.indexOf("<!--more-->");
        if (pos != -1 && type == VIEW_TYPE_HAS_LEN) {
            markdown = markdown.substring(0, pos);
        }

        List<Extension> extensions = Arrays.asList(TablesExtension.create(), AutolinkExtension.create(), StrikethroughExtension.create());

        Parser parser = Parser.builder().extensions(extensions).build();
        Node document = parser.parse(markdown);
        HtmlRenderer renderer = HtmlRenderer.builder()
                .extensions(extensions)
                .softbreak("<br/>") //这样设置就可以实现回车一次就换行
                .build();
        String content = renderer.render(document);

        // markdown to image
        //MutableDataSet options = new MutableDataSet();
        //options.setFrom(ParserEmulationProfile.MARKDOWN);
        //options.set(Parser.EXTENSIONS, Collections.singletonList(TablesExtension.create()));
        //Parser parser = Parser.builder(options).build();
        //HtmlRenderer renderer = HtmlRenderer.builder(options).build();
        //
        //Node document = parser.parse(markdown);
        //String content = renderer.render(document);

        content = emoji(content);

        // 支持网易云音乐输出
        if (content.contains("[mp3:")) {
            content = content.replaceAll("\\[mp3:(\\d+)\\]", "<div><iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=640 height=200 src=\"//music.163.com/outchain/player?type=2&id=$1&auto=0&height=100\"></iframe></div>");
        }
        // 支持gist代码输出
        if (content.contains("https://gist.github.com/")) {
            content = content.replaceAll("&lt;script src=\"https://gist.github.com/(\\w+)/(\\w+)\\.js\">&lt;/script>", "<script src=\"https://gist.github.com/$1/$2\\.js\"></script>");
        }
        return content;
    }


    /**
     * 提取html中的文字
     *
     * @param html
     * @return
     */
    public static String getHtmlText(String html) {
        if (StringUtils.isNotBlank(html)) {
            String value = HtmlUtils.htmlUnescape(html);
            value = value.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
            value = ArticleUtil.Html2Text(HtmlUtils.htmlUnescape(value));
            return value;
        }
        return "";
    }

    public static String htmlToText(String html, int type) {
        if (StringUtils.isNotBlank(html)) {
            int pos = html.indexOf("<!--more-->");
            if (pos != -1) {
                if (type == VIEW_TYPE_HAS_LEN) {
                    html = html.substring(0, pos);
                }
                return getHtmlText(mdToHtml(html, type));
            } else {
                html = getHtmlText(mdToHtml(html, type));
                if (html.length() > ARTICLE_VIEW_LEN && type == VIEW_TYPE_HAS_LEN) {
                    return html.substring(0, ARTICLE_VIEW_LEN);
                }
                return html;
            }
        }
        return "";
    }

    //从html中提取纯文本
    public static String Html2Text(String inputString) {
        String txtcontent = inputString.replaceAll("</?[^>]+>", ""); //剔出<html>的标签
        txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");//去除字符串中的空格,回车,换行符,制表符
        return txtcontent;
    }

}
