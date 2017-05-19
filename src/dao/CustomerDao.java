package dao;

import model.CustomerEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.Query;

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
        return customerEntity;
    }
}
