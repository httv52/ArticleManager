package cn.hutaotao.article.model.custom;

import lombok.Data;

/**
 * Created by ht on 2018/4/25.
 *
 * @author ht
 */
@Data
public class NameValue {
    private String name;

    private String value;

    public NameValue() {
    }

    public NameValue(String name, String value) {
        this.name = name;
        this.value = value;
    }
}
