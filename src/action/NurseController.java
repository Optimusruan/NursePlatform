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
import java.io.UnsupportedEncodingException;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/19.
 */
@Controller
public class NurseController {
    public static int SIZE = 20;
    private NurseService getNurseService(HttpServletRequest request){
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ServletContext servletContext = request.getServletContext();
        String str = servletContext.getRealPath("/");
        ApplicationContext applicationContext = new FileSystemXmlApplicationContext(str+"WEB-INF/applicationContext.xml");
        return (NurseService) applicationContext.getBean("nurseService");
    }
    @RequestMapping("nurseHome")
    public String nurseHome(@RequestParam("id") String id, Map model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getSession().getAttribute("id")!=null&&request.getSession().getAttribute("id").toString().equals(id))
        {
            NurseService nurseService = getNurseService(request);
            model.put("info",nurseService.getDetailByHome(id));
            model.put("services",nurseService.getNurseServices(id));
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
        NurseService nurseService =getNurseService(request);
        model.put("info",nurseService.getDetail(id));
        return "nurseDetail";
    }

    @RequestMapping(value = "nurseList")
    public String nurseList(Map model,HttpServletRequest request) throws UnsupportedEncodingException {
        NurseService nurseService = getNurseService(request);
        String cond = request.getParameter("cond");
        String current = request.getParameter("current");
        String nurseName = new String(request.getParameter("nurseName").getBytes("ISO-8859-1"),"utf-8");
        model.put("info",nurseService.getNurseListByPage(Integer.parseInt(current),SIZE,cond,nurseName));
        model.put("maxPage",nurseService.getMaxPage(SIZE,cond,nurseName));
        model.put("cond",cond);
        return "ajaxLoadView/nurseList";
    }
    @RequestMapping("excellentNurses")
    public String excellentNurses(Map model,HttpServletRequest request){
        NurseService nurseService = getNurseService(request);
        String size =  request.getParameter("size");
        model.put("info",nurseService.getExcellentNurses(Integer.parseInt(size)));
        return "ajaxLoadView/showNurse";
    }
    @RequestMapping("searchNurse")
    public String searchNurse(Map model,HttpServletRequest request)
    {
        return "searchNurse";
    }
}
