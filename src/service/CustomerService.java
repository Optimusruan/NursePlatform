package service;

import dao.CustomerDao;
import dao.ServiceDetailDao;
import model.CustomerEntity;

import java.util.List;

/**
 * Created by Administrator on 2017/5/19.
 */
public class CustomerService {
    private CustomerDao customerDao;
    private ServiceDetailDao serviceDetailDao;

    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    public void setServiceDetailDao(ServiceDetailDao serviceDetailDao) {
        this.serviceDetailDao = serviceDetailDao;
    }

    public CustomerEntity getDetail(String id) {

        CustomerEntity customerEntity = customerDao.getModel(id);
        customerEntity.setCusIdno("验证通过");
        customerEntity.setCusContact("");
        return customerEntity;
    }

    public CustomerEntity getDetailByHome(String id) {
        return customerDao.getModel(id);
    }


    public List getCustomerServices(String id) {
        return serviceDetailDao.getCustomerService(id);
    }

    public boolean confirmRv(String id) {
        return serviceDetailDao.maniRv(id, 4);
    }

    public boolean cancelRv(String id) {
        return serviceDetailDao.maniRv(id, 3);
    }
}
