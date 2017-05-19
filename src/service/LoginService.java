package service;

import dao.LoginDao;

/**
 * Created by Administrator on 2017/5/18.
 */
public class LoginService {
    private LoginDao loginDao;

    public int checkLogin(String userType,String username,String password){
        return loginDao.login(userType,username,password);
    }

    public void setLoginDao(LoginDao loginDao) {
        this.loginDao = loginDao;
    }
}
