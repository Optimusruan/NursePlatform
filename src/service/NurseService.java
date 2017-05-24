package service;

import dao.NurseDao;
import dao.ServiceDetailDao;
import model.NurseEntity;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/19.
 */
public class NurseService {
    private NurseDao nurseDao;

    public void setNurseDao(NurseDao nurseDao) {
        this.nurseDao = nurseDao;
    }
    public NurseEntity getDetail(String id){

        NurseEntity nurseEntity = nurseDao.getModel(id);
        nurseEntity.setNurIdno("验证通过");
        nurseEntity.setNurContact("");
        return nurseEntity;
    }
    public NurseEntity getDetailByHome(String id){
        return nurseDao.getModel(id);
    }

    public List getNurseList(String cond,String nurseName) {
        return nurseDao.getNurseList(cond, nurseName);
    }
    public boolean updateNurse(String id, Map details){
        return nurseDao.updateNurse(id,details);
    }


    public List getNurseListByPage(int current, int size, String cond, String nurseName) {
        if (cond.equals("") && nurseName.equals("")) {
            return nurseDao.getNurseListByPage(current, size);
        } else {
            return nurseDao.getNurseListByPageAndCond(current, size, cond, nurseName);
        }
    }

    public List getExcellentNurses(int size) {
        return nurseDao.getExcellentNurses(size);
    }

    public int getMaxPage(int size, String cond, String nurseName) {
        List list = nurseDao.getNurseList(cond, nurseName);
        int sum = list.size();
        list.clear();
        if (sum % size == 0) {
            return sum / size;
        } else {
            return sum / size + 1;
        }

    }

    public List getNurseServices(String id)
    {
           ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
           ServiceDetailDao serviceDetailDao = (ServiceDetailDao) ctx.getBean("serviceDetailDao");

        return serviceDetailDao.getNurseService(id);
    }

    public boolean agreeRv(String id) {
        ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
        ServiceDetailDao serviceDetailDao = (ServiceDetailDao) ctx.getBean("serviceDetailDao");

        return serviceDetailDao.maniRv(id,1);
    }
    public boolean refuseRv(String id) {
        ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
        ServiceDetailDao serviceDetailDao = (ServiceDetailDao) ctx.getBean("serviceDetailDao");

        return serviceDetailDao.maniRv(id,2);
    }
}
