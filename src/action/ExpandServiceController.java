package action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import res.ServiceConstructor;
import service.NurseService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/26.
 */
@Controller
public class ExpandServiceController {
    @RequestMapping("dateService")
    public String dateService(@RequestParam("id") String id, HttpServletRequest request, Map model, HttpServletResponse response) throws IOException {
        NurseService nurseService = (NurseService) ServiceConstructor.newService("nurseService", request);
        String str = nurseService.getNurseServicesByString(id);
        model.put("id", id);
        model.put("time",str);
        return "ajaxLoadView/showDate";
    }
}
