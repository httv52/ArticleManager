package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.FileMapper;
import cn.hutaotao.article.exception.MyException;
import cn.hutaotao.article.model.File;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.service.FileService;
import cn.hutaotao.article.utils.code.UUIDUtil;
import cn.hutaotao.article.utils.format.FileSuffixUtil;
import cn.hutaotao.article.utils.format.FormatUtil;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by ht on 2017/9/26.
 */
@Service
public class FileServiceImpl implements FileService {
    @Autowired
    FileMapper fileMapper;


    @Override
    public String uploadFile(MultipartFile file, User sessionUser) throws Exception {
        if (sessionUser == null) {
            throw new MyException("登录状态已过期");
        }

        //获取文件上传流
        byte[] fbytes = new byte[0];
        fbytes = file.getBytes();

        //文件名称在服务器有可能重复
        String newFileName = FormatUtil.getNewFileName();


        //获取文件扩展名
        String relaFileName = file.getOriginalFilename();
        String suffix = relaFileName.substring(relaFileName.lastIndexOf("."));

        String fullPath = File.PIC_HOST + "/upload/" + newFileName + suffix;

        String relativePath = "/upload/" + newFileName + suffix;

        //创建jesy服务器，进行跨服务器上传
        Client client = Client.create();
        //把文件关联到远程服务器
        WebResource resource = client.resource(File.PIC_HOST + "/upload/" + newFileName + suffix);
        //上传
        resource.put(String.class, fbytes);

        //若上传成功
        File myFile = new File();

        myFile.setId(UUIDUtil.getUUID());
        myFile.setFileUrl(relativePath);
        myFile.setRealName(relaFileName);
        myFile.setFileType(FileSuffixUtil.getTypeOfSuffix(suffix));
        myFile.setCreated(System.currentTimeMillis());
        myFile.setUser(sessionUser);

        saveFile(myFile);

        //ajax回调函数需要回显写什么东西？
        //图片需要回显：需要图片完整路径
        //数据库保存图片的相对路径.

        //{"":"","":""}
        String result = "{\"success\":true,\"fullPath\":\"" + fullPath + "\",\"relativePath\":\"" + relativePath + "\"}";

        return result;
    }

    public void saveFile(File file) {
        fileMapper.saveFile(file);
    }

    @Override
    public Integer findFileCount(String loginUserId) {
        return fileMapper.findFileCount(loginUserId);
    }

    @Override
    public List<File> findAllFileByUser(String loginUserId, Integer pageNow, Integer pageSize, Integer fileType) {
        return fileMapper.findAllFileByUser(loginUserId, pageNow, pageSize, fileType);
    }

    @Override
    public Integer findFileCountByType(String loginUserId, Integer type) {
        return fileMapper.findFileCountByType(loginUserId, type);
    }

    @Override
    public List<File> findFileGroupByType(String uid) {
        return fileMapper.findFileGroupByType(uid);
    }

    @Override
    public String deleteFileById(String fileId) {
        try {
            if (StringUtils.isBlank(fileId)) {
                throw new MyException("文件 ID 为空，删除失败");
            }

            fileMapper.deleteFileById(fileId);

            return "{\"success\":true}";
        } catch (Exception e) {
            throw new MyException("分类删除失败");
        }
    }

}
