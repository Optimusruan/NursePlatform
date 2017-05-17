package action;

import dao.NurseInitDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Administrator on 2017/5/17.
 */
@Controller
public class Dispatcher {
    @RequestMapping("init")
    public void init(HttpServletRequest request, HttpServletResponse response) throws IOException {
        NurseInitDao nurseInitDao = new NurseInitDao();
        PrintWriter printWriter = response.getWriter();
        printWriter.print("aaaa");
    }
}
