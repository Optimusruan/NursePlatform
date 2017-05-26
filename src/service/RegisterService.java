package service;

import dao.RegisterDao;

import java.util.Map;

/**
 * Created by hp on 2017/5/19.
 */
public class RegisterService {
    private RegisterDao registerDao;

    public int register(String userType, Map details) {
        //   ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
        //   RegisterDao registerDao = (RegisterDao)ctx.getBean("registerDao");
        int id = 0;
        if (userType != null && details != null) {
            if (userType.equals("nurse") || userType == "nurse") {
                id = registerDao.nurseRegister(details);
            } else if (userType.equals("customer") || userType == "customer") {
                id = registerDao.customerRegister(details);
            }
        }
        return id;
    }

    public void setRegisterDao(RegisterDao registerDao) {
        this.registerDao = registerDao;
    }
}
