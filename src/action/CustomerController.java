package action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CustomerService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/19.
 */
@Controller
public class CustomerController {
    private CustomerService getCustomerService(HttpServletRequest request){
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ServletContext servletContext = request.getServletContext();
        String str = servletContext.getRealPath("/");
        ApplicationContext applicationContext = new FileSystemXmlApplicationContext(str+"WEB-INF/applicationContext.xml");
        return (CustomerService) applicationContext.getBean("customerService");
    }
    @RequestMapping("customerHome")
    public String customerHome(@RequestParam("id") String id, Map model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getSession().getAttribute("id")!=null&&request.getSession().getAttribute("id").toString().equals(id))
        {
            CustomerService customerService = getCustomerService(request);
            model.put("info",customerService.getDetailByHome(id));
            model.put("services",customerService.getCustomerServices(id));
            return "customerHome";
        }
        else{
            PrintWriter printWriter = response.getWriter();
            printWriter.print("<script>window.location.href='login.jsp';</script>");
            return null;
        }
    }
    @RequestMapping("customerDetail")
    public String customerDetail(@RequestParam("id") String id,Map model,HttpServletRequest request)
    {
        CustomerService customerService = getCustomerService(request);
        model.put("info",customerService.getDetail(id));
        return "customerDetail";
    }
    @RequestMapping("confirmRv")
    @ResponseBody
    public void confirmRv(@RequestParam("id")String id,HttpServletRequest request)
    {
        CustomerService customerService = getCustomerService(request);
        customerService.confrimRv(id);
    }
    @RequestMapping("cancelRv")
    @ResponseBody
    public void cancelRv(@RequestParam("id")String id,HttpServletRequest request)
    {
        CustomerService customerService = getCustomerService(request);
        customerService.cancelRv(id);
    }

}
