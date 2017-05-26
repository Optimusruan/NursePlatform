package dao;

import model.CustomerEntity;
import model.NurseEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import java.util.Map;

/**
 * Created by hp on 2017/5/19.
 */
public class RegisterDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public int nurseRegister(Map details) {
        int id = -1;
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        NurseEntity nurse = new NurseEntity();
        ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
        NurseDao nurseDao = (NurseDao) ctx.getBean("nurseDao");
        int nurId = nurseDao.getMaxId();
        if (nurId > 0) {
            nurse.setNurId(nurId);
        }
        if (details.get("nurAdd") != null) {
            nurse.setNurAdd((String) details.get("nurAdd"));
        }
        if (details.get("nurAge") != null && !details.get("nurAge").equals("")) {
            nurse.setNurAge(Integer.parseInt(details.get("nurAge").toString()));
        }
        if (details.get("nurAvt") != null && !details.get("nurAvt").equals("")) {
            nurse.setNurAvt((String) details.get("nurAvt"));
        }
        if (details.get("nurContact") != null) {
            nurse.setNurContact((String) details.get("nurContact"));
        }
        if (details.get("nurEdu") != null) {
            nurse.setNurEdu((String) details.get("nurEdu"));
        }
        if (details.get("nurIdno") != null) {
            nurse.setNurIdno((String) details.get("nurIdno"));
        }
        if (details.get("nurName") != null) {
            nurse.setNurName((String) details.get("nurName"));
        }
        if (details.get("nurOrigin") != null) {
            nurse.setNurOrigin((String) details.get("nurOrigin"));
        }
        if (details.get("nurPos") != null) {
            nurse.setNurPos((String) details.get("nurPos"));
        }
        if (details.get("nurPrice") != null && !details.get("nurPrice").equals("")) {
            nurse.setNurPrice(Integer.parseInt(details.get("nurPrice").toString()));
        }
        if (details.get("nurUname") != null) {
            nurse.setNurUname((String) details.get("nurUname"));
        }
        if (details.get("nurPwd") != null) {
            nurse.setNurPwd((String) details.get("nurPwd"));
        }
        if (details.get("nurRank") != null && !details.get("nurRank").equals("")) {
            nurse.setNurRank(Integer.parseInt(details.get("nurRank").toString()));
        }


        session.save(nurse);
        id = nurse.getNurId();
        tx.commit();

        session.close();
        sessionFactory.close();
        if (id == 1) {
            id = nurId;
        }
        return nurId;
    }

    public int customerRegister(Map details) {
        int id = -1;
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        CustomerEntity customer = new CustomerEntity();
        ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
        CustomerDao customerDao = (CustomerDao) ctx.getBean("customerDao");
        int cusId = customerDao.getMaxId();
        if (cusId > 0) {
            customer.setCusId(cusId);
        }
        if (details.get("cusAdd") != null) {
            customer.setCusAdd((String) details.get("cusAdd"));
        }
        if (details.get("cusAvt") != null) {
            customer.setCusAvt((String) details.get("cusAvt"));
        }
        if (details.get("cusContact") != null) {
            customer.setCusContact((String) details.get("cusContact"));
        }
        if (details.get("cusIdno") != null) {
            customer.setCusIdno((String) details.get("cusIdno"));
        }
        if (details.get("cusName") != null) {
            customer.setCusName((String) details.get("cusName"));
        }
        if (details.get("cusPos") != null) {
            customer.setCusPos((String) details.get("cusPos"));
        }
        if (details.get("cusUname") != null) {
            customer.setCusUname((String) details.get("cusUname"));
        }
        if (details.get("cusPwd") != null) {
            customer.setCusPwd((String) details.get("cusPwd"));
        }

        session.save(customer);
        id = customer.getCusId();
        tx.commit();
        session.close();
        return id;
    }
}
