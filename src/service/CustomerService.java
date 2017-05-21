package service;

import dao.CustomerDao;
import model.CustomerEntity;

import java.util.List;

/**
 * Created by Administrator on 2017/5/19.
 */
public class CustomerService {
    private CustomerDao customerDao;

    public CustomerEntity getDetail(String id){

        CustomerEntity customerEntity = customerDao.getModel(id);
        customerEntity.setCusIdno("验证通过");
        customerEntity.setCusContact("");
        return customerEntity;
    }
    public CustomerEntity getDetailByHome(String id){
        return customerDao.getModel(id);
    }

    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }
    public List getCustomerServices(String id) {
        return customerDao.getCostomerService(id);
    }
}
