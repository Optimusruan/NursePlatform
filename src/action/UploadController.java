package action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import service.CustomerService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Driver;
import java.util.Properties;

/**
 * Created by wx on 2017/5/23.
 */
@Controller
public class UploadController {
//    private CustomerService getCustomerService(HttpServletRequest request){
//        try {
//            request.setCharacterEncoding("UTF-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
//        ServletContext servletContext = request.getServletContext();
//        String str = servletContext.getRealPath("/");
//        ApplicationContext applicationContext = new FileSystemXmlApplicationContext(str+"WEB-INF/applicationContext.xml");
//        return (CustomerService) applicationContext.getBean("customerService");
//    }

    @RequestMapping("uploadfile")
    public String saveDriver(HttpServletRequest request, @RequestParam(value = "file",
            required = false) CommonsMultipartFile filedata)
    {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        // 保存相对路径到数据库 图片写入服务器
        if (filedata != null && !filedata.isEmpty()) {
            System.out.println(filedata);
            // 获取图片的文件名
            String fileName = filedata.getOriginalFilename();System.out.println(fileName);
            // 获取图片的扩展名
            String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);System.out.println(extensionName);
            // 新的图片文件名 = 获取时间戳+"."图片扩展名
            String newFileName = String.valueOf(System.currentTimeMillis()) + "." + extensionName;
            System.out.println(newFileName);
            try {
                //路径写入数据库写在这
                //保存图片
                saveFile(newFileName, filedata,request);
                return "uploadtest";
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("上传出错");
                return"head";
            }
        }else{
            return"index";
        }

    }

    private void saveFile(String newFileName, CommonsMultipartFile filedata,HttpServletRequest request) {
        String logoPathDir = "/web/assets/img";
        /*得到文件保存目录的真实路径*/
        String logoRealPathDir = request.getSession().getServletContext()
                .getRealPath(logoPathDir);
        /*根据真实路径创建目录*/
        File logoSaveFile = new File(logoRealPathDir);System.out.println(logoRealPathDir);
        if (!logoSaveFile.exists()) {
            logoSaveFile.mkdirs();
        }
                    /* 构建文件目录 */
//        File fileDir = new File(saveFilePath);
//        if (!fileDir.exists()) {
//            fileDir.mkdirs();
//        }
        try {
            FileOutputStream out = new FileOutputStream(logoRealPathDir + "\\" + newFileName);
            // 写入文件
            out.write(filedata.getBytes());
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
