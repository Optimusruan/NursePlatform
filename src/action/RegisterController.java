package action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.NurseService;
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
    public String Register(HttpServletRequest request, HttpServletResponse response){
        Map details = new HashMap();
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String userType = request.getParameter("usertype");
        String opt = request.getParameter("opt");

        if(userType == "customer" || userType.equals("customer")){
            details.put("cusName",request.getParameter("cus_name").trim());
            details.put("cusIdno",request.getParameter("cus_idno").trim());
            details.put("cusContact",request.getParameter("cus_contact").trim());
            details.put("cusAdd",request.getParameter("cus_add").trim());
            details.put("cusPos",request.getParameter("cus_pos").trim());
            details.put("cusUname",request.getParameter("cus_uname").trim());
            details.put("cusPwd",request.getParameter("cus_pwd").trim());
         //   details.put("cusAvt",request.getParameter("cus_avt").trim());
        }else if(userType == "nurse" || userType.equals("nurse")){
            details.put("nurName",request.getParameter("nur_name").trim());
            details.put("nurIdno",request.getParameter("nur_idno").trim());
            details.put("nurContact",request.getParameter("nur_contact").trim());
            details.put("nurAdd",request.getParameter("nur_add").trim());
            details.put("nurPos",request.getParameter("nur_pos").trim());
            details.put("nurUname",request.getParameter("nur_uname").trim());
            details.put("nurPwd",request.getParameter("nur_pwd").trim());
//            details.put("nurAvt",request.getParameter("nur_avt").trim());
//            details.put("nurRank",request.getParameter("nur_rank").trim());
            details.put("nurAge",request.getParameter("nur_age").trim());
            details.put("nurPrice",request.getParameter("nur_price").trim());
            details.put("nurEdu",request.getParameter("nur_edu").trim());
        }
        ServletContext servletContext = request.getServletContext();
        String str = servletContext.getRealPath("/");
        ApplicationContext applicationContext = new FileSystemXmlApplicationContext(str + "WEB-INF/applicationContext.xml");

        //注册
        if(opt == "reg" || opt.equals("reg")) {
            RegisterService registerService = (RegisterService) applicationContext.getBean("registerService");
            int id = registerService.register(userType, details);
            request.getSession().setAttribute("id",id);
        }
        //修改
        else if(opt == "mod" || opt.equals("mod")){
            //月嫂信息修改
            if(userType == "nurse" || userType.equals("nurse")){
                NurseService nurseService = (NurseService) applicationContext.getBean("nurseService");
                nurseService.updateNurse(request.getSession().getAttribute("id").toString(),details);
            }
// else if(userType == "customer" || userType.equals("customer")){
//                //客户信息修改
//
//           }
        }

        return "redirect:"+userType+"Home?id="+ request.getSession().getAttribute("id");
    }
    @RequestMapping("customerRegister")
    public String customerRegister(){
        return "customerRegister";
    }

    @RequestMapping("nurseRegister")
    public String nurseRegister(@RequestParam("opt") String opt,Map model,HttpServletRequest request, HttpServletResponse response){
        if(opt == "mod" || opt.equals("mod")){
            model.put("title","Modify 月嫂信息修改");
            model.put("opt","mod");
            model.put("act","修改");
            model.put("display"," style=display:none ");

            if(request.getSession().getAttribute("id")!=null){
                //根据id获取model修改信息
                String id = (request.getSession().getAttribute("id").toString());
                ServletContext servletContext = request.getServletContext();
                String str = servletContext.getRealPath("/");
                ApplicationContext applicationContext = new FileSystemXmlApplicationContext(str+"WEB-INF/applicationContext.xml");
                NurseService nurseService= (NurseService) applicationContext.getBean("nurseService");

                model.put("info",nurseService.getDetailByHome(id));
            }
        }else if(opt == "reg" || opt.equals("reg")){
            model.put("title","Register 月嫂注册");
            model.put("opt","reg");
            model.put("act","注册");
        }
        return "nurseRegister";
    }
}
