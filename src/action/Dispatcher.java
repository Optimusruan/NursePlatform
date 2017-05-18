package action;

import dao.NurseInitDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Administrator on 2017/5/17.
 */
@Controller
public class Dispatcher {
    @RequestMapping("init")
    public void init(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ServletContext servletContext = request.getServletContext();
        String str = servletContext.getRealPath("/");
        ApplicationContext applicationContext = new FileSystemXmlApplicationContext(str+"WEB-INF/applicationContext.xml");
        NurseInitDao nurseInitDao = (NurseInitDao) applicationContext.getBean("nurseInitDao");
        nurseInitDao.run();
        PrintWriter printWriter = response.getWriter();
        printWriter.print("finish");
    }

    @RequestMapping("customerRegister")
    public String customerRegister(){
        return "customerRegister";
    }

    @RequestMapping("nurseRegister")
    public String nurseRegister(){
        return "nurseRegister";
    }
}
