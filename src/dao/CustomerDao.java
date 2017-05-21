package dao;

import model.CustomerEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by Administrator on 2017/5/19.
 */
public class CustomerDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public CustomerEntity getModel(String id)
    {
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from CustomerEntity  where cusId=?");
        query.setParameter(0,Integer.parseInt(id));
        CustomerEntity customerEntity = (CustomerEntity) query.getSingleResult();
        session.close();
        return customerEntity;
    }

    public int getMaxId()
    {
        Session session = sessionFactory.openSession();
        org.hibernate.query.Query query = session.createQuery("select max(cusId) from CustomerEntity");
        int maxId = (Integer)query.uniqueResult();
        session.close();
        return maxId + 1;
    }
    public List getCostomerService(String id) {
        Session session = sessionFactory.openSession();
        org.hibernate.query.Query query = session.createQuery("from ServiceEntity where svcNurid=" + id);
        List list = query.list();
        session.close();
        return list;
    }
}
