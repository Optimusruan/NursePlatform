package dao;

import model.CustomerEntity;
import model.NurseEntity;
import model.ServiceEntity;
import model.mapModel.ServiceCustomer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by hp on 2017/5/22.
 */
public class ServiceDetailDao {
    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List getNurseService(String id) {
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from  ServiceEntity s,CustomerEntity c where s.svcCusid=c.cusId and s.svcNurid=?");
        query.setParameter(0,Integer.parseInt(id));
        List list = query.list();
        //list里面生成两个对象，一个service类，一个customer类
        for (int i=0;i<list.size();i++){
            Object obj[] = (Object[]) list.get(i);
            ServiceEntity s = (ServiceEntity) obj[0];
            CustomerEntity c = (CustomerEntity) obj[1];
            Map map = new HashMap();
            map.put("svcStatus",s.getSvcStatus());
            map.put("svcStart",s.getSvcStart());
            map.put("svcEnd",s.getSvcEnd());
            map.put("svcAble",s.getSvcAble());
            map.put("svcLevel",s.getSvcLevel());
            map.put("svcComment",s.getSvcComment());
            map.put("svcCusid",s.getSvcCusid());
            map.put("svcDate",s.getSvcDate());
            map.put("svcPps",s.getSvcPps());
            map.put("svcId",s.getSvcId());
            map.put("cusName",c.getCusName());

            list.set(i,map);
        }

        session.close();
        return list;
    }
    public List getCustomerService(String id) {
        Session session = sessionFactory.openSession();
        Query query = session.createQuery(" from ServiceEntity s,NurseEntity n where s.svcNurid=n.nurId and s.svcNurid=n.nurId and s.svcCusid=?");
        query.setParameter(0,Integer.parseInt(id));
        List list = query.list();
        for (int i=0;i<list.size();i++){
            Object obj[] = (Object[]) list.get(i);
            ServiceEntity s = (ServiceEntity) obj[0];
            NurseEntity n = (NurseEntity) obj[1];
            Map map = new HashMap();
            map.put("svcStatus",s.getSvcStatus());
            map.put("svcStart",s.getSvcStart());
            map.put("svcEnd",s.getSvcEnd());
            map.put("svcAble",s.getSvcAble());
            map.put("svcLevel",s.getSvcLevel());
            map.put("svcComment",s.getSvcComment());
            map.put("svcNurid",s.getSvcNurid());
            map.put("svcDate",s.getSvcDate());
            map.put("svcPps",s.getSvcPps());
            map.put("svcId",s.getSvcId());
            map.put("nurName",n.getNurName());
            map.put("nurPrice",n.getNurPrice());

            list.set(i,map);
        }
        session.close();
        return list;
    }

    public boolean maniRv(String id,int pps) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("update ServiceEntity set svcPps = ? where svcId=?");
        query.setParameter(0,pps);
        query.setParameter(1,Integer.parseInt(id));
        int res = query.executeUpdate();
        tx.commit();
        session.close();
        if(res > 0){
            return true;
        }else
            return false;
    }

    public boolean comment(String id, String level, String attitude, String comment) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("update ServiceEntity set svcLevel = ?,svcComment=?,svcPps=? where svcId=?");
        query.setParameter(0,Integer.parseInt(level));
        query.setParameter(1,attitude+"|"+comment);
        query.setParameter(2,5);
        query.setParameter(3,Integer.parseInt(id));
        query.executeUpdate();
        tx.commit();
        session.close();
        return true;
    }
}
