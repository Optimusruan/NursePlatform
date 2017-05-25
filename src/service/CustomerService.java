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
        ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
        ServiceDetailDao serviceDetailDao = (ServiceDetailDao) ctx.getBean("serviceDetailDao");

        return serviceDetailDao.getCustomerService(id);
    }

    public boolean confrimRv(String id) {
        ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
        ServiceDetailDao serviceDetailDao = (ServiceDetailDao) ctx.getBean("serviceDetailDao");

        return serviceDetailDao.maniRv(id,4);
    }

    public boolean cancelRv(String id) {
        ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
        ServiceDetailDao serviceDetailDao = (ServiceDetailDao) ctx.getBean("serviceDetailDao");

        return serviceDetailDao.maniRv(id,3);
    }

    public boolean comment(String id, String level, String attitude, String comment) {
        ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
        ServiceDetailDao serviceDetailDao = (ServiceDetailDao) ctx.getBean("serviceDetailDao");

        return serviceDetailDao.comment(id,level,attitude,comment);
    }
}
