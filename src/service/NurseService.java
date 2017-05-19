package service;

import dao.NurseDao;
import model.NurseEntity;

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
}