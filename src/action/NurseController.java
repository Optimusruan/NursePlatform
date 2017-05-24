package action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import dataBean.ResultAndSizeBean;
import org.springframework.web.bind.annotation.ResponseBody;
import service.NurseService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/19.
 */
@Controller
public class NurseController {
    private static int SIZE = 20;
    private static String[] CONDKEY = {"rank", "price"};
    private static HashMap<String, String> LEVEL = new HashMap<String, String>() {{
        put("一星", "1");
        put("二星", "2");
        put("三星", "3");
        put("四星", "4");
        put("五星", "5");
    }};

    private NurseService getNurseService(HttpServletRequest request) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ServletContext servletContext = request.getServletContext();
        String str = servletContext.getRealPath("/");
        ApplicationContext applicationContext = new FileSystemXmlApplicationContext(str + "WEB-INF/applicationContext.xml");
        return (NurseService) applicationContext.getBean("nurseService");
    }

    @RequestMapping("nurseHome")
    public String nurseHome(@RequestParam("id") String id, Map model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getSession().getAttribute("id") != null && request.getSession().getAttribute("id").toString().equals(id)) {
            NurseService nurseService = getNurseService(request);
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
        NurseService nurseService = getNurseService(request);
        model.put("info", nurseService.getDetail(id));
        return "nurseDetail";
    }

    @RequestMapping(value = "nurseList")
    public String nurseList(Map model, HttpServletRequest request) throws UnsupportedEncodingException {
        NurseService nurseService = getNurseService(request);
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
                    } else
                        cond.append("nur_").append(CONDKEY[i]).append(" like '%").append(temp).append("%'");
                }
            }
        }
        if(cond.toString().equals(" where ")){
            cond.delete(0,cond.length());
        }
        String order = request.getParameter("order");
        if (order!=null && !order.equals("")){
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
        NurseService nurseService = getNurseService(request);
        String size = request.getParameter("size");
        model.put("info", nurseService.getExcellentNurses(Integer.parseInt(size)));
        return "ajaxLoadView/showNurse";
    }

    @RequestMapping("searchNurse")
    public String searchNurse(Map model, HttpServletRequest request) {
        return "searchNurse";
    }

    @RequestMapping("agreeRv")
    @ResponseBody
    public void agreeRv(@RequestParam("id")String id,HttpServletRequest request)
    {
        NurseService nurseService = getNurseService(request);
        nurseService.agreeRv(id);
    }
    @RequestMapping("refuseRv")
    @ResponseBody
    public void refuseRv(@RequestParam("id")String id,HttpServletRequest request)
    {
        NurseService nurseService = getNurseService(request);
        nurseService.refuseRv(id);
    }
}
