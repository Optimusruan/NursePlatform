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
        sessionFactory.close();
        return nurseEntity;
    }
    public int getMaxId()
    {
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("select max(nurId) from NurseEntity");
        int maxId = (Integer)query.uniqueResult();
        session.close();
        return maxId + 1;
    }

    //全部查询
    public List getNurseList(String cond,String nurseName){
        Session session = sessionFactory.openSession();
        Query query =checkCond(cond,nurseName,session);
        List list = query.list();
        session.close();
        return list;
    }
    //分页查询
    public List getNurseListByPage(int current,int size){
        Session session = sessionFactory.openSession();
        Query query= session.createQuery("from NurseEntity ");
        query.setFirstResult((current-1)*size);
        query.setMaxResults(size);
        List list = query.list();
        session.close();
        return list;
    }
    //优秀月嫂查询
    public List getExcellentNurses(int size){
        Session session = sessionFactory.openSession();
        Query query= session.createQuery("from NurseEntity where nurRank=5");
        query.setMaxResults(size);
        List list  = query.list();
        session.close();
        return list;
    }
    public List getNurseListByPageAndCond(int current,int size,String cond,String nurseName){
        Session session = sessionFactory.openSession();
        Query query=checkCond(cond,nurseName,session);
        query.setFirstResult((current-1)*size);
        query.setMaxResults(size);
        List list = query.list();
        session.close();
        return list;
    }
    private Query checkCond(String cond,String nurseName,Session session){
        Query query;
        if(cond.equals("")&&!nurseName.equals(""))
        {
            System.out.println("1");
            query = session.createQuery("from NurseEntity where nurName like '%"+nurseName+"%'");
        }
        else if(!cond.equals("")&&nurseName.equals("")){
            System.out.println("2");
            query = session.createQuery("from NurseEntity where "+cond);
        }
        else {
            System.out.println("3");
            query = session.createQuery("from NurseEntity ");
        }
        return query;
    }
}
