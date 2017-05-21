package action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.LoginService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Administrator on 2017/5/18.
 */
@Controller
public class LoginController {
    @RequestMapping(value = "login")
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");
        ServletContext servletContext = request.getServletContext();
        String str = servletContext.getRealPath("/");
        ApplicationContext applicationContext = new FileSystemXmlApplicationContext(str+"WEB-INF/applicationContext.xml");
        LoginService loginService = (LoginService) applicationContext.getBean("loginService");
        int id = loginService.checkLogin(userType,username,password);
        if (id==-1)
        {
            PrintWriter printWriter = response.getWriter();
            printWriter.print("error");
        }
        else
        {
            request.getSession().setAttribute("id", id);
            PrintWriter printWriter = response.getWriter();
            printWriter.print(id);
        }
    }
    @RequestMapping("loginSystem")
    public String loginSystem(@RequestParam("userType") String userType,HttpServletRequest request,HttpServletResponse response){
        return "redirect:"+userType+"Home?id="+ request.getSession().getAttribute("id");
    }
    @RequestMapping("test")
    public void test(HttpServletRequest request) {
        System.out.print(request.getSession().getAttribute("id"));
    }
}
