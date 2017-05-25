package res;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

/**
 * Created by Administrator on 2017/5/25.
 */
public class ServiceConstructor {
    public static Object newService(String serviceName, HttpServletRequest request) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ServletContext servletContext = request.getServletContext();
        String str = servletContext.getRealPath("/");
        ApplicationContext applicationContext = new FileSystemXmlApplicationContext(str + "WEB-INF/applicationContext.xml");
        switch (serviceName) {
            case "nurseService":
                return applicationContext.getBean("nurseService");
            case "customerService":
                return applicationContext.getBean("customerService");
            case "loginService":
                return applicationContext.getBean("loginService");
            case "registerService":
                return applicationContext.getBean("registerService");
            default:
                return null;
        }

    }
}
