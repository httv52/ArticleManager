package cn.hutaotao.article.model.custom;

/**
 * 统计信息
 * Created by ht on 2018/4/20.
 *
 * @author ht
 */

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class CountBean {
    private Integer max;

    private Integer min;

    private List<CountInfoBean> countList = new ArrayList<>();
}
