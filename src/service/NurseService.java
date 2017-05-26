package service;

import dao.NurseDao;
import dao.ServiceDetailDao;
import dataBean.ResultAndSizeBean;
import model.NurseEntity;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/19.
 */
public class NurseService {
    private NurseDao nurseDao;
    private ServiceDetailDao serviceDetailDao;
    public void setNurseDao(NurseDao nurseDao) {
        this.nurseDao = nurseDao;
    }

    public void setServiceDetailDao(ServiceDetailDao serviceDetailDao) {
        this.serviceDetailDao = serviceDetailDao;
    }

    public NurseEntity getDetail(String id, int opt) {
        NurseEntity nurseEntity = nurseDao.getModel(id);
        switch (opt){
            case 1:
            nurseEntity.setNurIdno("验证通过");
            nurseEntity.setNurContact("");
            break;
            case 2:break;
        }
        return nurseEntity;
    }

    public NurseEntity getDetailByHome(String id) {
        return nurseDao.getModel(id);
    }

    public List getNurseList(String cond, String nurseName) {
        return nurseDao.getNurseList(cond, nurseName);
    }

    public boolean updateNurse(String id, Map details) {
        return nurseDao.updateNurse(id, details);
    }


    public ResultAndSizeBean getNurseListByPage(int current, int size, String cond, String nurseName) {
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

    public List getNurseServices(String id) {
        return serviceDetailDao.getNurseService(id);
    }


    //处理来自nurseDetail的AJAX请求
    public boolean processRv(String nurseId,String customerId,String opt) {
        if (opt.equals("1")) {
            return serviceDetailDao.addAppointment(nurseId,customerId);
        }
        else if(opt.equals("0")){
            return serviceDetailDao.cancelAppointment(nurseId,customerId);
        }
        else{
            return false;
        }
    }
    public boolean isAppoint(String nurseId,String customerId){
        return serviceDetailDao.getServiceStatusByTwoId(nurseId,customerId);
    }

    public boolean agreeRv(String id) {
        return serviceDetailDao.maniRv(id, 1);
    }

    public boolean refuseRv(String id) {
        return serviceDetailDao.maniRv(id, 2);
    }
}
