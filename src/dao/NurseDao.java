package dao;

import model.NurseEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.Query;


/**
 * Created by Administrator on 2017/5/19.
 */
public class NurseDao {
    private SessionFactory sessionFactory;

    public NurseEntity getModel(String id)
    {
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from NurseEntity where nurId=?");
        query.setParameter(0,Integer.parseInt(id));
        NurseEntity nurseEntity = (NurseEntity) query.getSingleResult();
        return nurseEntity;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
