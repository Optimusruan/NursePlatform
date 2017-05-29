package action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import res.ServiceConstructor;
import service.CustomerService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/19.
 */
@Controller
public class CustomerController {
    @RequestMapping("customerHome")
    public String customerHome(@RequestParam("id") String id, Map model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Object loginId = request.getSession().getAttribute("id");
        Object loginType = request.getSession().getAttribute("userType");
        if (loginId != null && loginId.toString().equals(id) & loginType != null && loginType.toString().equals("customer")) {
            CustomerService customerService = (CustomerService) ServiceConstructor.newService("customerService", request);
            model.put("info", customerService.getDetailByHome(id));
            model.put("services", customerService.getCustomerServices(id));
            return "customerHome";
        } else {
            PrintWriter printWriter = response.getWriter();
            printWriter.print("<script>window.location.href='login.jsp';</script>");
            return null;
        }
    }

    @RequestMapping("customerDetail")
    public String customerDetail(@RequestParam("id") String id, Map model, HttpServletRequest request) {
        CustomerService customerService = (CustomerService) ServiceConstructor.newService("customerService", request);
        model.put("info", customerService.getDetail(id));
        return "customerDetail";
    }

    @RequestMapping("confirmRv")
    @ResponseBody
    public void confirmRv(@RequestParam("id") String id, HttpServletRequest request) {
        CustomerService customerService = (CustomerService) ServiceConstructor.newService("customerService", request);
        customerService.confirmRv(id,request.getSession().getAttribute("id").toString());
    }

    @RequestMapping("cancelRv")
    @ResponseBody
    public void cancelRv(@RequestParam("id") String id, HttpServletRequest request) {
        CustomerService customerService = (CustomerService) ServiceConstructor.newService("customerService", request);
        customerService.cancelRv(id,request.getSession().getAttribute("id").toString());
    }
    @RequestMapping("comment")
    @ResponseBody
    public void comment(@RequestParam("id") String id,@RequestParam("level") String level,@RequestParam("attitude") String attitude,@RequestParam("comment") String comment,HttpServletRequest request)
    {
        CustomerService customerService = (CustomerService) ServiceConstructor.newService("customerService",request);
//        try {
//            comment = new String(comment.getBytes("ISO-8859-1"),"utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        customerService.comment(id,level,attitude,comment);
    }

}
