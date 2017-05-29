package service;

import dao.CustomerDao;
import dao.ServiceDetailDao;
import model.CustomerEntity;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

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

    public boolean confirmRv(String id,String customerId) {
        return serviceDetailDao.maniRv(id, 4,customerId);
    }

    public boolean cancelRv(String id,String customerId) {
        return serviceDetailDao.maniRv(id, 3,customerId);
    }

    public boolean comment(String id, String level, String attitude, String comment) {
        ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
        ServiceDetailDao serviceDetailDao = (ServiceDetailDao) ctx.getBean("serviceDetailDao");

        return serviceDetailDao.comment(id,level,attitude,comment);
    }
}
