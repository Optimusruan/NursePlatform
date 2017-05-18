package model;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/5/16.
 */
@Entity
@Table(name = "nurse", schema = "nurseplatform", catalog = "")
public class NurseEntity {
    private Integer nurId;
    private String nurName;
    private String nurIdno;
    private String nurContact;
    private String nurAdd;
    private String nurPos;
    private String nurUname;
    private String nurPwd;
    private String nurAvt;
    private Double nurRpt;
    private Integer nurRank;
    private Integer nurAge;
    private Integer nurStatus;
    private String nurOrigin;
    private String nurEdu;
    private Integer nurPrice;

    @Id
    @Column(name = "nur_id", nullable = false)
    public Integer getNurId() {
        return nurId;
    }

    public void setNurId(Integer nurId) {
        this.nurId = nurId;
    }

    @Basic
    @Column(name = "nur_name", nullable = false, length = 20)
    public String getNurName() {
        return nurName;
    }

    public void setNurName(String nurName) {
        this.nurName = nurName;
    }

    @Basic
    @Column(name = "nur_idno", nullable = true, length = 30)
    public String getNurIdno() {
        return nurIdno;
    }

    public void setNurIdno(String nurIdno) {
        this.nurIdno = nurIdno;
    }

    @Basic
    @Column(name = "nur_contact", nullable = true, length = 20)
    public String getNurContact() {
        return nurContact;
    }

    public void setNurContact(String nurContact) {
        this.nurContact = nurContact;
    }

    @Basic
    @Column(name = "nur_add", nullable = true, length = 200)
    public String getNurAdd() {
        return nurAdd;
    }

    public void setNurAdd(String nurAdd) {
        this.nurAdd = nurAdd;
    }

    @Basic
    @Column(name = "nur_pos", nullable = true, length = 50)
    public String getNurPos() {
        return nurPos;
    }

    public void setNurPos(String nurPos) {
        this.nurPos = nurPos;
    }

    @Basic
    @Column(name = "nur_uname", nullable = false, length = 10)
    public String getNurUname() {
        return nurUname;
    }

    public void setNurUname(String nurUname) {
        this.nurUname = nurUname;
    }

    @Basic
    @Column(name = "nur_pwd", nullable = false, length = 20)
    public String getNurPwd() {
        return nurPwd;
    }

    public void setNurPwd(String nurPwd) {
        this.nurPwd = nurPwd;
    }

    @Basic
    @Column(name = "nur_avt", nullable = true, length = 100)
    public String getNurAvt() {
        return nurAvt;
    }

    public void setNurAvt(String nurAvt) {
        this.nurAvt = nurAvt;
    }

    @Basic
    @Column(name = "nur_rpt", nullable = true, precision = 0)
    public Double getNurRpt() {
        return nurRpt;
    }

    public void setNurRpt(Double nurRpt) {
        this.nurRpt = nurRpt;
    }

    @Basic
    @Column(name = "nur_rank", nullable = true)
    public Integer getNurRank() {
        return nurRank;
    }

    public void setNurRank(Integer nurRank) {
        this.nurRank = nurRank;
    }

    @Basic
    @Column(name = "nur_age", nullable = true)
    public Integer getNurAge() {
        return nurAge;
    }

    public void setNurAge(Integer nurAge) {
        this.nurAge = nurAge;
    }

    @Basic
    @Column(name = "nur_status", nullable = true)
    public Integer getNurStatus() {
        return nurStatus;
    }

    public void setNurStatus(Integer nurStatus) {
        this.nurStatus = nurStatus;
    }

    @Basic
    @Column(name = "nur_origin", nullable = true, length = 10)
    public String getNurOrigin() {
        return nurOrigin;
    }

    public void setNurOrigin(String nurOrigin) {
        this.nurOrigin = nurOrigin;
    }

    @Basic
    @Column(name = "nur_edu", nullable = true, length = 10)
    public String getNurEdu() {
        return nurEdu;
    }

    public void setNurEdu(String nurEdu) {
        this.nurEdu = nurEdu;
    }

    @Basic
    @Column(name = "nur_price", nullable = true)
    public Integer getNurPrice() {
        return nurPrice;
    }

    public void setNurPrice(Integer nurPrice) {
        this.nurPrice = nurPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        NurseEntity that = (NurseEntity) o;

        if (nurId != null ? !nurId.equals(that.nurId) : that.nurId != null) return false;
        if (nurName != null ? !nurName.equals(that.nurName) : that.nurName != null) return false;
        if (nurIdno != null ? !nurIdno.equals(that.nurIdno) : that.nurIdno != null) return false;
        if (nurContact != null ? !nurContact.equals(that.nurContact) : that.nurContact != null) return false;
        if (nurAdd != null ? !nurAdd.equals(that.nurAdd) : that.nurAdd != null) return false;
        if (nurPos != null ? !nurPos.equals(that.nurPos) : that.nurPos != null) return false;
        if (nurUname != null ? !nurUname.equals(that.nurUname) : that.nurUname != null) return false;
        if (nurPwd != null ? !nurPwd.equals(that.nurPwd) : that.nurPwd != null) return false;
        if (nurAvt != null ? !nurAvt.equals(that.nurAvt) : that.nurAvt != null) return false;
        if (nurRpt != null ? !nurRpt.equals(that.nurRpt) : that.nurRpt != null) return false;
        if (nurRank != null ? !nurRank.equals(that.nurRank) : that.nurRank != null) return false;
        if (nurAge != null ? !nurAge.equals(that.nurAge) : that.nurAge != null) return false;
        if (nurStatus != null ? !nurStatus.equals(that.nurStatus) : that.nurStatus != null) return false;
        if (nurOrigin != null ? !nurOrigin.equals(that.nurOrigin) : that.nurOrigin != null) return false;
        if (nurEdu != null ? !nurEdu.equals(that.nurEdu) : that.nurEdu != null) return false;
        if (nurPrice != null ? !nurPrice.equals(that.nurPrice) : that.nurPrice != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = nurId != null ? nurId.hashCode() : 0;
        result = 31 * result + (nurName != null ? nurName.hashCode() : 0);
        result = 31 * result + (nurIdno != null ? nurIdno.hashCode() : 0);
        result = 31 * result + (nurContact != null ? nurContact.hashCode() : 0);
        result = 31 * result + (nurAdd != null ? nurAdd.hashCode() : 0);
        result = 31 * result + (nurPos != null ? nurPos.hashCode() : 0);
        result = 31 * result + (nurUname != null ? nurUname.hashCode() : 0);
        result = 31 * result + (nurPwd != null ? nurPwd.hashCode() : 0);
        result = 31 * result + (nurAvt != null ? nurAvt.hashCode() : 0);
        result = 31 * result + (nurRpt != null ? nurRpt.hashCode() : 0);
        result = 31 * result + (nurRank != null ? nurRank.hashCode() : 0);
        result = 31 * result + (nurAge != null ? nurAge.hashCode() : 0);
        result = 31 * result + (nurStatus != null ? nurStatus.hashCode() : 0);
        result = 31 * result + (nurOrigin != null ? nurOrigin.hashCode() : 0);
        result = 31 * result + (nurEdu != null ? nurEdu.hashCode() : 0);
        result = 31 * result + (nurPrice != null ? nurPrice.hashCode() : 0);
        return result;
    }
}
