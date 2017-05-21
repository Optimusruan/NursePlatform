package dao;

import model.NurseEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;
import java.util.Map;


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
    public boolean updateNurse(String id, Map details){
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from NurseEntity where nurId=?");
        query.setParameter(0,Integer.parseInt(id));
        NurseEntity nurse = (NurseEntity) query.getSingleResult();

        Transaction tx = session.beginTransaction();

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
        tx.commit();

        session.close();

        return true;
    }

    //全部查询
    public List getNurseList(){
        Session session = sessionFactory.openSession();
        List list = session.createQuery("from NurseEntity").list();
        session.close();
        return list;
    }
    //分页查询
    public List getNurseListByPage(int current,int size,String cond){
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

}
