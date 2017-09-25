package cn.hutaotao.article.controller;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * Created by ht on 2017/8/30.
 */
@Controller
@RequestMapping("/upload")
public class UploadController extends BaseController {
    public static final String PIC_HOST = "http://127.0.0.1:8081/SSMDemo2_img";

    @RequestMapping("uploadPic")
    public void uploadPic(MultipartFile file, HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
        //获取文件上传流
        byte[] fbytes = new byte[0];
        try {
            fbytes = file.getBytes();
        } catch (IOException e) {
            e.printStackTrace();
        }

        //文件名称在服务器有可能重复
        String newFileName;
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        newFileName = format.format(new Date());

        Random r = new Random();

        for (int i = 0; i < 3; i++) {
            newFileName = newFileName + r.nextInt(10);
        }

        //获取文件扩展名
        String originalFilename = file.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));

        //创建jesy服务器，进行跨服务器上传
        Client client = Client.create();
        //把文件关联到远程服务器
        WebResource resource = client.resource(PIC_HOST + "/upload/" + newFileName + suffix);
        //上传
        try {
            resource.put(String.class, fbytes);
        } catch (Exception e) {
            e.printStackTrace();
        }


        //ajax回调函数需要回显写什么东西？
        //图片需要回显：需要图片完整路径
        //数据库保存图片的相对路径.
        String fullPath = PIC_HOST + "/upload/" + newFileName + suffix;

        String relativePath = "/upload/" + newFileName + suffix;
        //{"":"","":""}
        String result = "{\"fullPath\":\"" + fullPath + "\",\"relativePath\":\"" + relativePath + "\"}";

        out.print(result);
    }

}
