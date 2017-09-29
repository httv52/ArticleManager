package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.exception.MyException;
import cn.hutaotao.article.model.File;
import cn.hutaotao.article.service.FileService;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * Created by ht on 2017/8/30.
 */
@Controller
@RequestMapping("/file")
public class FileController extends BaseController {
    @Autowired
    FileService fileService;

    @RequestMapping("uploadFile")
    public void uploadFile(MultipartFile file, PrintWriter out, HttpSession session) {
        try {
            String result = "";
            result = fileService.uploadFile(file, getLoginUser(session));
            out.print(result);
        } catch (Exception e) {
            String msg = "文价上传失败，请重新上传";
            if (e instanceof MyException) {
                msg = e.getMessage();
            } else {
                LOGGER.error(msg, e);
            }
            throw new MyException(msg);
        }

    }

//    @RequestMapping("fileManage")
//    public String fileManage() {
//
//    }
}
