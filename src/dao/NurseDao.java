package dao;

import model.NurseEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;


/**
 * Created by Administrator on 2017/5/19.
 */
public class NurseDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public NurseEntity getModel(String id)
    {
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from NurseEntity where nurId=?");
        query.setParameter(0,Integer.parseInt(id));
        NurseEntity nurseEntity = (NurseEntity) query.getSingleResult();
        session.close();
        return nurseEntity;
    }
    //全部查询
    public List getNurseList(){
        Session session = sessionFactory.openSession();
        List list = session.createQuery("from NurseEntity").list();
        session.close();
        return list;
    }
    //分页查询
    public List getNurseListByPage(int current,int size){
        Session session = sessionFactory.openSession();
        Query query= session.createQuery("from NurseEntity ");
        query.setFirstResult((current-1)*size);
        query.setMaxResults(size);
        return query.list();
    }
    //优秀月嫂查询
    public List getExcellentNurses(int size){
        Session session = sessionFactory.openSession();
        Query query= session.createQuery("from NurseEntity where nurRank=5");
        query.setMaxResults(size);
        return query.list();
    }

}
