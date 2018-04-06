package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.TagMapper;
import cn.hutaotao.article.exception.MyException;
import cn.hutaotao.article.model.Article;
import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.Tag;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.model.custom.ArticleTagCustomer;
import cn.hutaotao.article.service.TagService;
import cn.hutaotao.article.utils.code.UUIDUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ht on 2017/9/25.
 */
@Service
public class TagServiceImpl implements TagService {
    @Autowired
    TagMapper tagMapper;

    @Override
    public void insertTag(Tag tag) {
        tagMapper.insertTag(tag);
    }

    @Override
    public void insertArticleTag(String[] myOldTagIds, String[] myNewTag, String aid, User user) {
        //在做文章更新时，先删除旧标签
        deletetArticle_Tag(aid);

        List<String> myNewTagIds = new ArrayList<>();
        Tag tag;

        /*添加新标签*/
        // 首先判断新标签不要为空
        if (myNewTag != null && myNewTag.length > 0) {
            for (int i = 0; i < myNewTag.length; i++) {
                tag = new Tag();
                String newTagId = UUIDUtil.getUUID();

                tag.setTagid(newTagId);
                tag.setTagname(myNewTag[i]);
                tag.setUser(user);

                insertTag(tag);  //添加标签

                myNewTagIds.add(newTagId);
            }
        }// 标签不要为空 -end


        /*维护文章-标签 表*/
        ArticleTagCustomer customer;

        // 添加新标签到 article-tag
        if (myNewTagIds.size() > 0) {
            for (int i = 0; i < myNewTagIds.size(); i++) {
                customer = new ArticleTagCustomer();
                customer.setId(UUIDUtil.getUUID());
                customer.setAid(aid);
                customer.setTagId(myNewTagIds.get(i));

                insertArticle_Tag(customer);
            }
        }

        // 添加旧标签到 article-tag
        if (myOldTagIds != null && myOldTagIds.length > 0) {
            for (int i = 0; i < myOldTagIds.length; i++) {
                customer = new ArticleTagCustomer();
                customer.setId(UUIDUtil.getUUID());
                customer.setAid(aid);
                customer.setTagId(myOldTagIds[i]);

                insertArticle_Tag(customer);
            }
        }
    }

    /**
     * 批量删除标签
     *
     * @param aid
     */
    private void deletetArticle_Tag(String aid) {
        tagMapper.deletetArticle_Tag(aid);
    }

    @Override
    public void insertArticle_Tag(ArticleTagCustomer customer) {
        tagMapper.insertArticle_Tag(customer);
    }

    @Override
    public List<Tag> findTagByUser(String loginUserId) {
        return tagMapper.findTagByUser(loginUserId);
    }

    @Override
    public List<Tag> findTagWithArticle(String loginUserId) {
        return tagMapper.findTagWithArticle(loginUserId);
    }

    @Override
    public String deleteTagById(String tagId) {
        try {
            if (!StringUtils.isNotBlank(tagId)) {
                throw new MyException("标签 id 不能为空");
            }
            tagMapper.deleteTagById(tagId);

            return "{\"success\":true}";
        } catch (Exception e) {
            String msg = "未知原因";
            if (e instanceof MyException) {
                msg = e.getMessage();
            }
            throw new MyException("分类删除失败：" + msg);
        }
    }
}
