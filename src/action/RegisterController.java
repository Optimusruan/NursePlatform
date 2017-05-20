package action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.RegisterService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hp on 2017/5/19.
 */
@Controller
public class RegisterController {
    @RequestMapping(value = "register")
    public void Register(HttpServletRequest request, HttpServletResponse response){
        Map details = new HashMap();
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String userType = request.getParameter("usertype");
        if(userType == "cus" || userType.equals("cus")){
            details.put("cusName",request.getParameter("cus_name"));
            details.put("cusIdno",request.getParameter("cus_idno"));
            details.put("cusContact",request.getParameter("cus_contact"));
            details.put("cusAdd",request.getParameter("cus_add"));
            details.put("cusPos",request.getParameter("cus_pos"));
            details.put("cusUname",request.getParameter("cus_uname"));
            details.put("cusPwd",request.getParameter("cus_pwd"));
            details.put("cusAvt",request.getParameter("cus_avt"));
        }else if(userType == "nur" || userType.equals("nur")){
            details.put("nurName",request.getParameter("nur_name"));
            details.put("nurIdno",request.getParameter("nur_idno"));
            details.put("nurContact",request.getParameter("nur_contact"));
            details.put("nurAdd",request.getParameter("nur_add"));
            details.put("nurPos",request.getParameter("nur_pos"));
            details.put("nurUname",request.getParameter("nur_uname"));
            details.put("nurPwd",request.getParameter("nur_pwd"));
            details.put("nurAvt",request.getParameter("nur_avt"));
            details.put("nurRank",request.getParameter("nur_rank"));
            details.put("nurAge",request.getParameter("nur_age"));
            details.put("nurPrice",request.getParameter("nur_price"));
            details.put("nurEdu",request.getParameter("nur_edu"));
        }
        ServletContext servletContext = request.getServletContext();
        String str = servletContext.getRealPath("/");
        ApplicationContext applicationContext = new FileSystemXmlApplicationContext(str+"WEB-INF/applicationContext.xml");
        RegisterService registerService= (RegisterService) applicationContext.getBean("registerService");
        int id = registerService.register(userType,details);

        if (id == -1)
        {
            PrintWriter printWriter = null;
            try {
                printWriter = response.getWriter();
            } catch (IOException e) {
                e.printStackTrace();
            }
            printWriter.println("error");
        }
        else
        {
            request.getSession().setAttribute("id", id);
            PrintWriter printWriter = null;
            try {
                printWriter = response.getWriter();
            } catch (IOException e) {
                e.printStackTrace();
            }
            printWriter.print(id);
            printWriter.print(details.toString());
        }
    }
    @RequestMapping("customerRegister")
    public String customerRegister(){
        return "/customerRegister";
    }

    @RequestMapping("nurseRegister")
    public String nurseRegister(){
        return "/nurseRegister";
    }
}
