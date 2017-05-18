package service;

import dao.LoginDao;

/**
 * Created by Administrator on 2017/5/18.
 */
public class LoginService {
    public static int checkLogin(String userType,String username,String password,LoginDao loginDao){
        return loginDao.login(userType,username,password);
    }
}
