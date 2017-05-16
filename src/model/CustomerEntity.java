package model;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/5/16.
 */
@Entity
@Table(name = "customer", schema = "nurseplatform", catalog = "")
public class CustomerEntity {
    private Integer cusId;
    private String cusName;
    private String cusIdno;
    private String cusContact;
    private String cusAdd;
    private String cusPos;
    private String cusUname;
    private String cusPwd;
    private String cusAvt;

    @Id
    @Column(name = "cus_id", nullable = false)
    public Integer getCusId() {
        return cusId;
    }

    public void setCusId(Integer cusId) {
        this.cusId = cusId;
    }

    @Basic
    @Column(name = "cus_name", nullable = false, length = 20)
    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    @Basic
    @Column(name = "cus_idno", nullable = false, length = 30)
    public String getCusIdno() {
        return cusIdno;
    }

    public void setCusIdno(String cusIdno) {
        this.cusIdno = cusIdno;
    }

    @Basic
    @Column(name = "cus_contact", nullable = false, length = 20)
    public String getCusContact() {
        return cusContact;
    }

    public void setCusContact(String cusContact) {
        this.cusContact = cusContact;
    }

    @Basic
    @Column(name = "cus_add", nullable = false, length = 200)
    public String getCusAdd() {
        return cusAdd;
    }

    public void setCusAdd(String cusAdd) {
        this.cusAdd = cusAdd;
    }

    @Basic
    @Column(name = "cus_pos", nullable = false, length = 50)
    public String getCusPos() {
        return cusPos;
    }

    public void setCusPos(String cusPos) {
        this.cusPos = cusPos;
    }

    @Basic
    @Column(name = "cus_uname", nullable = false, length = 10)
    public String getCusUname() {
        return cusUname;
    }

    public void setCusUname(String cusUname) {
        this.cusUname = cusUname;
    }

    @Basic
    @Column(name = "cus_pwd", nullable = false, length = 20)
    public String getCusPwd() {
        return cusPwd;
    }

    public void setCusPwd(String cusPwd) {
        this.cusPwd = cusPwd;
    }

    @Basic
    @Column(name = "cus_avt", nullable = false, length = 100)
    public String getCusAvt() {
        return cusAvt;
    }

    public void setCusAvt(String cusAvt) {
        this.cusAvt = cusAvt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CustomerEntity that = (CustomerEntity) o;

        if (cusId != null ? !cusId.equals(that.cusId) : that.cusId != null) return false;
        if (cusName != null ? !cusName.equals(that.cusName) : that.cusName != null) return false;
        if (cusIdno != null ? !cusIdno.equals(that.cusIdno) : that.cusIdno != null) return false;
        if (cusContact != null ? !cusContact.equals(that.cusContact) : that.cusContact != null) return false;
        if (cusAdd != null ? !cusAdd.equals(that.cusAdd) : that.cusAdd != null) return false;
        if (cusPos != null ? !cusPos.equals(that.cusPos) : that.cusPos != null) return false;
        if (cusUname != null ? !cusUname.equals(that.cusUname) : that.cusUname != null) return false;
        if (cusPwd != null ? !cusPwd.equals(that.cusPwd) : that.cusPwd != null) return false;
        if (cusAvt != null ? !cusAvt.equals(that.cusAvt) : that.cusAvt != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = cusId != null ? cusId.hashCode() : 0;
        result = 31 * result + (cusName != null ? cusName.hashCode() : 0);
        result = 31 * result + (cusIdno != null ? cusIdno.hashCode() : 0);
        result = 31 * result + (cusContact != null ? cusContact.hashCode() : 0);
        result = 31 * result + (cusAdd != null ? cusAdd.hashCode() : 0);
        result = 31 * result + (cusPos != null ? cusPos.hashCode() : 0);
        result = 31 * result + (cusUname != null ? cusUname.hashCode() : 0);
        result = 31 * result + (cusPwd != null ? cusPwd.hashCode() : 0);
        result = 31 * result + (cusAvt != null ? cusAvt.hashCode() : 0);
        return result;
    }
}
