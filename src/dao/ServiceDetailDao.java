package dao;

import model.NurseEntity;
import model.ServiceEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.Date;
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
        Query query = session.createQuery("select new model.mapModel.ServiceCustomerMapping(s.svcId,s.svcCusid,s.svcNurid, s.svcStatus, s.svcPps, s.svcStart, s.svcEnd, s.svcComment, s.svcLevel,s.svcDate,s.svcAble,c.cusName) from  ServiceEntity s,CustomerEntity c where s.svcCusid=c.cusId and s.svcNurid=? order by s.svcStart desc ");
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
    public List getNurseStatus(String id){
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("select new model.mapModel.ServiceCustomerMapping(s.svcId,s.svcCusid,s.svcNurid, s.svcStatus, s.svcPps, s.svcStart, s.svcEnd, s.svcComment, s.svcLevel,s.svcDate,s.svcAble,c.cusName) from  ServiceEntity s,CustomerEntity c where s.svcPps>3 and s.svcCusid=c.cusId and s.svcNurid=? order by s.svcStart desc ");
        query.setParameter(0, Integer.parseInt(id));
        List list = query.list();
        return list;
    }
    public boolean maniRv(String id, int pps, String homeId) {

        Session session = sessionFactory.openSession();
        List list = null;
        if (pps == 1 || pps == 4) {
            Transaction tx = session.beginTransaction();
            if (pps == 1) {
                list = session.createQuery("from ServiceEntity where  svcAble=1 and svcNurid=" + homeId).list();
            } else {
                list = session.createQuery("from ServiceEntity  where svcPps<4 and svcAble=1 and svcCusid=" + homeId).list();
            }
            try {
                ServiceEntity currentObject = session.get(ServiceEntity.class, new Integer(id));
                long currentStart = currentObject.getSvcStart().getTime();
                long currentEnd = currentObject.getSvcEnd().getTime();
                for (Object aList : list) {
                    ServiceEntity serviceEntity = (ServiceEntity) aList;
                    long tempStart = serviceEntity.getSvcStart().getTime();
                    long tempEnd = serviceEntity.getSvcEnd().getTime();
                    if (serviceEntity.getSvcId() == Integer.parseInt(id)) {
                        serviceEntity.setSvcPps(pps);
                        session.update(serviceEntity);
                        continue;
                    }
                    if ((tempStart <= currentEnd && tempStart >= currentStart) || (tempEnd <= currentEnd && tempEnd >= currentStart)) {
                        if(pps==1)
                        {
                            serviceEntity.setSvcPps(2);
                        }
                        else  serviceEntity.setSvcPps(3);
                        serviceEntity.setSvcAble((byte) 0);
                        session.update(serviceEntity);
                    }
                }
                tx.commit();
                return true;
            } catch (Exception e) {
                tx.rollback();
                return false;
            }
        } else if (pps == 2 || pps == 3) {
            Transaction tx = session.beginTransaction();
            ServiceEntity currentObject = session.get(ServiceEntity.class, new Integer(id));
            if (currentObject != null) {
                currentObject.setSvcPps(pps);
                session.update(currentObject);
            } else {
                return false;
            }
            tx.commit();
            session.close();
            return true;
        }
        return false;
    }

    //生成预约关系
    public boolean addAppointment(String nurseId, String customerId, Date svcStart, Date svcEnd) {
        System.out.println(svcStart.toString());
        System.out.println(svcEnd.toString());
        try {
            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            ServiceEntity serviceEntity = new ServiceEntity();
            serviceEntity.setSvcNurid(Integer.parseInt(nurseId));
            serviceEntity.setSvcCusid(Integer.parseInt(customerId));
            serviceEntity.setSvcPps(0);
            serviceEntity.setSvcStatus(1);
            serviceEntity.setSvcAble((byte) 1);
            serviceEntity.setSvcStart(new java.sql.Date(svcStart.getTime()));
            serviceEntity.setSvcEnd(new java.sql.Date(svcEnd.getTime()));
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
            Query query = session.createQuery("from ServiceEntity where svcNurid=" + nurseId + " and svcCusid=" + customerId + " and svcAble=1");
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

    public boolean getServiceStatusByTwoId(String nurseId, String customerId, String now) {
        Session session = sessionFactory.openSession();
        if (session.createQuery("from ServiceEntity where svcAble=1 and svcEnd>'" + now + "' and svcNurid=" + nurseId + " and svcCusid=" + customerId).list().size() > 0) {
            session.close();
            return false;
        } else {
            session.close();
            return true;
        }
    }

    public boolean comment(String id, String level, String attitude, String comment) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("update ServiceEntity set svcLevel = ?,svcComment=?,svcPps=? where svcId=?");
        query.setParameter(0, Integer.parseInt(level));
        query.setParameter(1, attitude + "|" + comment);
        query.setParameter(2, 5);
        query.setParameter(3, Integer.parseInt(id));
        query.executeUpdate();
        tx.commit();

        query = session.createQuery("select svcNurid from ServiceEntity where svcId=?");
        query.setParameter(0, Integer.parseInt(id));
        int nurid = (int)query.getSingleResult();

        query = session.createQuery("select avg(svcLevel) from ServiceEntity where svcNurid = ? and svcLevel is not null ");
        query.setParameter(0, nurid);
        Double avgLevel = (Double) query.getSingleResult();

        tx.begin();
        query = session.createQuery("update NurseEntity set nurRpt = ? where nurId = ?");
        query.setParameter(0, avgLevel);
        query.setParameter(1, nurid);
        query.executeUpdate();
        tx.commit();

        session.close();
        return true;
    }
}
