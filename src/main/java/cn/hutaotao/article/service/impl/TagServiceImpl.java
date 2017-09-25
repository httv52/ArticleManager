package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.TagMapper;
import cn.hutaotao.article.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ht on 2017/9/25.
 */
@Service
public class TagServiceImpl implements TagService {
    @Autowired
    TagMapper tagMapper;
}
