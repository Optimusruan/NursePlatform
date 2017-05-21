package service;

import dao.NurseDao;
import model.NurseEntity;

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
    public boolean updateNurse(String id, Map details){
        return nurseDao.updateNurse(id,details);
    }
    public List getNurseList(){
        return nurseDao.getNurseList();
    }

    public List getNurseListByPage(int current, int size,String cond) {
        return nurseDao.getNurseListByPage(current, size,cond);
    }

    public List getExcellentNurses(int size) {
        return nurseDao.getExcellentNurses(size);
    }

    public int getMaxPage(int size) {
        List list = nurseDao.getNurseList();
        int sum = list.size();
        list.clear();
        if (sum % size == 0) {
            return sum / size;
        } else {
            return sum /size + 1;
        }

    }
}
