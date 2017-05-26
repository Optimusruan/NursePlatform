package action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import res.ServiceConstructor;
import service.CustomerService;
import service.LoginService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

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
        LoginService loginService = (LoginService) ServiceConstructor.newService("loginService", request);
        int id = loginService.checkLogin(userType, username, password);
        if (id == -1) {
            PrintWriter printWriter = response.getWriter();
            printWriter.print("error");
        } else {
            request.getSession().setAttribute("id", id);
            request.getSession().setAttribute("userType", userType);
            PrintWriter printWriter = response.getWriter();
            printWriter.print(id);
        }
    }

    @RequestMapping("loginSystem")
    public String loginSystem(@RequestParam("userType") String userType, HttpServletRequest request, HttpServletResponse response) {
        request.getSession().setAttribute("userType", userType);
        return "redirect:" + userType + "Home?id=" + request.getSession().getAttribute("id");
    }

    @RequestMapping("test")
    public void test(HttpServletRequest request) {
        System.out.print(request.getSession().getAttribute("id"));
    }
    @RequestMapping("logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outvalue = null;
        request.getSession().setAttribute("id",outvalue );
        request.getSession().setAttribute("userType", outvalue);
        response.setCharacterEncoding("GBK");
        PrintWriter printWriter = response.getWriter();
        printWriter.print("<script type='text/javascript'>alert ('注销成功，请重新登录！');window.location.href='login.jsp';</script>");
    }

}
