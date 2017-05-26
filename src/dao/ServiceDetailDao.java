package dao;

import model.NurseEntity;
import model.ServiceEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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
        Query query = session.createQuery("select new model.mapModel.ServiceCustomer(s.svcId,s.svcCusid,s.svcNurid, s.svcStatus, s.svcPps, s.svcStart, s.svcEnd, s.svcComment, s.svcLevel,s.svcDate,s.svcAble,c.cusName) from  ServiceEntity s,CustomerEntity c where s.svcCusid=c.cusId and s.svcNurid=?");
        query.setParameter(0, Integer.parseInt(id));
        List list = query.list();
//        //list里面生成两个对象，一个service类，一个customer类
//        for (int i=0;i<list.size();i++){
//            Object obj[] = (Object[]) list.get(i);
//            ServiceEntity s = (ServiceEntity) obj[0];
//            CustomerEntity c = (CustomerEntity) obj[1];
//            Map map = new HashMap();
//            map.put("svcStatus",s.getSvcStatus());
//            map.put("svcStart",s.getSvcStart());
//            map.put("svcEnd",s.getSvcEnd());
//            map.put("svcAble",s.getSvcAble());
//            map.put("svcLevel",s.getSvcLevel());
//            map.put("svcComment",s.getSvcComment());
//            map.put("svcCusid",s.getSvcCusid());
//            map.put("svcDate",s.getSvcDate());
//            map.put("svcPps",s.getSvcPps());
//            map.put("svcId",s.getSvcId());
//            map.put("cusName",c.getCusName());
//
//            list.set(i,map);
//        }
        System.out.println(list.size());
        session.close();
        return list;
    }

    public List getCustomerService(String id) {
        Session session = sessionFactory.openSession();
        Query query = session.createQuery(" from ServiceEntity s,NurseEntity n where s.svcNurid=n.nurId and s.svcNurid=n.nurId and s.svcCusid=?");
        query.setParameter(0, Integer.parseInt(id));
        List list = query.list();
        for (int i = 0; i < list.size(); i++) {
            Object obj[] = (Object[]) list.get(i);
            ServiceEntity s = (ServiceEntity) obj[0];
            NurseEntity n = (NurseEntity) obj[1];
            Map map = new HashMap();
            map.put("svcStatus", s.getSvcStatus());
            map.put("svcStart", s.getSvcStart());
            map.put("svcEnd", s.getSvcEnd());
            map.put("svcAble", s.getSvcAble());
            map.put("svcLevel", s.getSvcLevel());
            map.put("svcComment", s.getSvcComment());
            map.put("svcNurid", s.getSvcNurid());
            map.put("svcDate", s.getSvcDate());
            map.put("svcPps", s.getSvcPps());
            map.put("svcId", s.getSvcId());
            map.put("nurName", n.getNurName());
            map.put("nurPrice", n.getNurPrice());

            list.set(i, map);
        }
        session.close();
        return list;
    }

    public boolean maniRv(String id, int pps) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("update ServiceEntity set svcPps = ? where svcId=?");
        query.setParameter(0, pps);
        query.setParameter(1, Integer.parseInt(id));
        int res = query.executeUpdate();
        tx.commit();
        session.close();
        if (res > 0) {
            return true;
        } else
            return false;
    }

    //生成预约关系
    public boolean addAppointment(String nurseId, String customerId) {
        try {
            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            ServiceEntity serviceEntity = new ServiceEntity();
            serviceEntity.setSvcNurid(Integer.parseInt(nurseId));
            serviceEntity.setSvcCusid(Integer.parseInt(customerId));
            serviceEntity.setSvcPps(0);
            serviceEntity.setSvcAble((byte) 1);
            session.save(serviceEntity);
            tx.commit();
            session.close();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    //取消预约关系
    public boolean cancelAppointment(String nurseId, String customerId) {
        try {
            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            Query query = session.createQuery("from ServiceEntity where svcNurid=" + nurseId + " and svcCusid=" + customerId);
            ServiceEntity serviceEntity = (ServiceEntity) query.getSingleResult();
            serviceEntity.setSvcPps(3);
            serviceEntity.setSvcAble((byte) 0);
            session.update(serviceEntity);
            tx.commit();
            session.close();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    public boolean getServiceStatusByTwoId(String nurseId, String customerId) {
        Session session = sessionFactory.openSession();
        if (session.createQuery("from ServiceEntity where svcAble=1 and svcNurid=" + nurseId + " and svcCusid=" + customerId).list().size() > 0) {
            session.close();
            return false;
        } else {
            session.close();
            return true;
        }
    }
}
