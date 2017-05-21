package dao;

import model.CustomerEntity;
import model.NurseEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by Administrator on 2017/5/18.
 */
public class LoginDao {
    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public int login(String userType,String username,String password){
        int id = -1;
        Session session = sessionFactory.openSession();
        if(userType.equals("nurse"))
        {
            Query query =session.createQuery("from NurseEntity where nurUname=? and nurPwd=?");
            query.setParameter(0,username);
            query.setParameter(1,password);
            List list = query.list();
            if (list.size()==1)
            {
                NurseEntity nurseEntity = (NurseEntity) query.getSingleResult();
                id = nurseEntity.getNurId();
            }
            session.close();
            sessionFactory.close();
        }
        else if(userType.equals("customer"))
        {
            Query query =session.createQuery("from CustomerEntity where cusUname=? and cusPwd=?");
            query.setParameter(0,username);
            query.setParameter(1,password);
            List list = query.list();
            if (list.size()==1)
            {
                CustomerEntity customerEntity = (CustomerEntity) query.getSingleResult();
                id = customerEntity.getCusId();
            }
            session.close();
            sessionFactory.close();
        }
        return id;
    }


}
