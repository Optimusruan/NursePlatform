package action;

import dataBean.ResultAndSizeBean;
import model.NurseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import res.ServiceConstructor;
import service.NurseService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/19.
 */
@Controller
public class NurseController {
    private static int SIZE = 20;
    private static String[] CONDKEY = {"rank", "price","add"};
    private static HashMap<String, String> LEVEL = new HashMap<String, String>() {{
        put("一星", "1");
        put("二星", "2");
        put("三星", "3");
        put("四星", "4");
        put("五星", "5");
    }};

    @RequestMapping("nurseHome")
    public String nurseHome(@RequestParam("id") String id, Map model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getSession().getAttribute("id") != null && request.getSession().getAttribute("id").toString().equals(id)) {
            NurseService nurseService = (NurseService) ServiceConstructor.newService("nurseService",request);
            model.put("info", nurseService.getDetailByHome(id));
            model.put("services", nurseService.getNurseServices(id));
            return "nurseHome";
        } else {
            PrintWriter printWriter = response.getWriter();
            printWriter.print("<script>window.location.href='login.jsp';</script>");
            return null;
        }
    }

    @RequestMapping("nurseDetail")
    public String nurseDetail(@RequestParam("id") String id, Map model, HttpServletRequest request) {
        NurseService nurseService = (NurseService) ServiceConstructor.newService("nurseService",request);
        model.put("info", nurseService.getDetail(id, 1));
        if(request.getSession().getAttribute("id")!=null&&!request.getSession().getAttribute("id").equals("")){
            model.put("appoint",nurseService.isAppoint(id,request.getSession().getAttribute("id").toString()));
        }else {
            model.put("appoint",true);
        }
        return "nurseDetail";
    }

    @RequestMapping(value = "nurseList")
    public String nurseList(Map model, HttpServletRequest request) throws UnsupportedEncodingException {
        NurseService nurseService = (NurseService) ServiceConstructor.newService("nurseService",request);
        StringBuilder cond = new StringBuilder();
        cond.append(" where ");
        for (int i = 0; i < CONDKEY.length; i++) {
            boolean isNum = false;
//            System.out.println(CONDKEY[i]);
//            System.out.println(request.getParameter(CONDKEY[i] + "Cond"));
            String temp = new String(request.getParameter(CONDKEY[i] + "Cond").getBytes("ISO-8859-1"), "utf-8");
            model.put(CONDKEY[i] + "Cond", temp);
            if (CONDKEY[i].equals("rank")) {
                temp = LEVEL.get(temp);
                isNum = true;
            }
            if (isNum) {
                if (temp != null) {
                    if (!cond.toString().equals(" where ")) {
                        cond.append(" and ");
                    }
                    cond.append("nur_").append(CONDKEY[i]).append(" like '%").append(temp).append("%'");
                }
            } else {
                if (temp != null && !temp.equals("")) {
                    if (!cond.toString().equals(" where ")) {
                        cond.append(" and ");
                    }
                    if (CONDKEY[i].equals("price")) {
                        String str[] = temp.split("-");
                        cond.append("nur_").append(CONDKEY[i]).append(" between ").append(str[0]).append(" and ").append(str[1]);
                    } else {
                        cond.append("nur_").append(CONDKEY[i]).append(" like '%").append(temp).append("%'");
                    }
                }
            }
        }
        String time = request.getParameter("startTime");
        if(time!=null&&!time.equals("")){
            cond.append("nur_id not in(select svc_nurid from service where svc_start<=").append(time).append(" and svc_end>=").append(time).append(" ");
        }
        if (cond.toString().equals(" where ")) {
            cond.delete(0, cond.length());
        }
        String order = request.getParameter("order");
        if (order != null && !order.equals("")) {
            String orderResult[] = order.split("-_-");
            cond.append(" order by nur_").append(orderResult[0]).append(" ").append(orderResult[1]);
        }
        String current = request.getParameter("current");
        String nurseName = new String(request.getParameter("nurseName").getBytes("ISO-8859-1"), "utf-8");
        ResultAndSizeBean resultAndSizeBean = nurseService.getNurseListByPage(Integer.parseInt(current), SIZE, cond.toString(), nurseName);
        model.put("info", resultAndSizeBean.list);
        model.put("maxPage", resultAndSizeBean.size);
        return "ajaxLoadView/nurseList";
    }

    @RequestMapping("excellentNurses")
    public String excellentNurses(Map model, HttpServletRequest request) {
        NurseService nurseService = (NurseService) ServiceConstructor.newService("nurseService",request);
        String size = request.getParameter("size");
        model.put("info", nurseService.getExcellentNurses(Integer.parseInt(size)));
        return "ajaxLoadView/showNurse";
    }

    @RequestMapping("searchNurse")
    public String searchNurse(Map model, HttpServletRequest request) throws ParseException {
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        model.put("nowTime",dateFormat.format(date));
        return "searchNurse";
    }

    @RequestMapping("agreeRv")
    @ResponseBody
    public void agreeRv(@RequestParam("id") String id, HttpServletRequest request) {
        NurseService nurseService = (NurseService) ServiceConstructor.newService("nurseService",request);
        nurseService.agreeRv(id);
    }

    @RequestMapping("refuseRv")
    @ResponseBody
    public void refuseRv(@RequestParam("id") String id, HttpServletRequest request) {
        NurseService nurseService = (NurseService) ServiceConstructor.newService("nurseService",request);
        nurseService.refuseRv(id);
    }

    @RequestMapping("showTel")
    public void showTel(@RequestParam("id") String id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        NurseService nurseService = (NurseService) ServiceConstructor.newService("nurseService",request);
        NurseEntity nurseEntity = nurseService.getDetail(id, 2);
        PrintWriter printWriter = response.getWriter();
        System.out.println(id);
        response.setCharacterEncoding("utf-8");
        if (request.getSession().getAttribute("id") != null) {
            if (nurseEntity.getNurContact() == null) {
                printWriter.print("该月嫂未留联系方式");
            } else {
                printWriter.print(nurseEntity.getNurContact());
            }
        } else {
            printWriter.print("No way");
        }
    }
    @RequestMapping("appoint")
    public void appoint(HttpServletResponse response, @RequestParam("opt")String opt, @RequestParam("id") String id, HttpSession session,HttpServletRequest request) throws IOException {
        PrintWriter printWriter = response.getWriter();
        NurseService nurseService = (NurseService) ServiceConstructor.newService("nurseService",request);
        if(session.getAttribute("id")!=null&&!session.getAttribute("id").equals("")) {
            if (id != null && !id.equals("")) {
                printWriter.print(nurseService.processRv(id, session.getAttribute("id").toString(),opt)?"success":"error");
            } else {
                printWriter.print("error");
            }
        }else{
            printWriter.print("login");
        }
    }
}
