package action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.NurseService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/19.
 */
@Controller
public class NurseController {
    private ApplicationContext getApplicationContext(HttpServletRequest request){
        ServletContext servletContext = request.getServletContext();
        String str = servletContext.getRealPath("/");
        return new FileSystemXmlApplicationContext(str+"WEB-INF/applicationContext.xml");
    }
    @RequestMapping("nurseHome")
    public String nurseHome(@RequestParam("id") String id, Map model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getSession().getAttribute("id")!=null&&request.getSession().getAttribute("id").toString().equals(id))
        {
            ApplicationContext applicationContext = getApplicationContext(request);
//            model.put("id",id);
            NurseService nurseService = (NurseService) applicationContext.getBean("nurseService");
            model.put("info",nurseService.getDetailByHome(id));
            return "nurseHome";
        }
        else{
            PrintWriter printWriter = response.getWriter();
            printWriter.print("<script>window.location.href='login.jsp';</script>");
            return null;
        }
    }
    @RequestMapping("nurseDetail")
    public String nurseDetail(@RequestParam("id") String id,Map model,HttpServletRequest request)
    {
        ApplicationContext applicationContext = getApplicationContext(request);
        NurseService nurseService = (NurseService) applicationContext.getBean("nurseService");
        model.put("info",nurseService.getDetail(id));
        return "nurseDetail";
    }

}
