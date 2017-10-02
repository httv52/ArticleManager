package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.exception.MyException;
import cn.hutaotao.article.model.File;
import cn.hutaotao.article.model.custom.PageBean;
import cn.hutaotao.article.service.FileService;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
import java.util.Iterator;
import java.util.List;
import java.util.Random;

/**
 * Created by ht on 2017/8/30.
 */
@Controller
@RequestMapping("/file")
public class FileController extends BaseController {
    /**
     * 每页八个文件
     */
    private static final Integer PAGE_SIZESTR = 8;

    @Autowired
    FileService fileService;

    @RequestMapping("uploadFile")
    public void uploadFile(@RequestParam("file") MultipartFile file, PrintWriter out, HttpSession session) {
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

    @RequestMapping("multipUloadFile")
    public void multipUloadFile(MultipartHttpServletRequest request, PrintWriter out, HttpSession session) throws IOException {
        try {
            Iterator<String> itr = request.getFileNames();
            String result = "";
            while (itr.hasNext()) {
                String uploadedFile = itr.next();
                MultipartFile file = request.getFile(uploadedFile);

                result = fileService.uploadFile(file, getLoginUser(session));
                out.print(result);
            }

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

    @RequestMapping("fileManage")
    public String fileManage(Model model, HttpSession session, HttpServletRequest request,
                             @ModelAttribute("type") String type) {
        String loginUserId = getLoginUserId(session);

        Integer fileType = type.equals("") ? null : Integer.valueOf(type);
        Integer totalCount = fileService.findFileCountByType(loginUserId, fileType);

        String pageNowStr = request.getParameter("pageNow");
        Integer pageNow = null == pageNowStr ? 1 : Integer.parseInt(pageNowStr);

        List<File> fileTypeList = fileService.findFileGroupByType(loginUserId);
        Integer allMyFile = fileService.findFileCount(loginUserId);

        PageBean pageBean = new PageBean(totalCount, pageNow, PAGE_SIZESTR);

        List<File> fileList = fileService.findAllFileByUser(loginUserId, pageBean.getStartPos(), PAGE_SIZESTR, fileType);


        model.addAttribute("allMyFile", allMyFile);
        model.addAttribute("fileList", fileList);
        model.addAttribute("fileTypeList", fileTypeList);
        model.addAttribute("pageBean", pageBean);
        return "admin/fileManage";
    }

    @RequestMapping("fileUpload")
    public String fileUpload() {
        return "admin/fileUpload";
    }

    @RequestMapping("/delete")
    public void deleteCategory(HttpServletRequest request, PrintWriter out) {
        String fileId = request.getParameter("fileId");

        String result = fileService.deleteFileById(fileId);

        out.print(result);
    }
}
