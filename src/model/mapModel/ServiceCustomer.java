package model.mapModel;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by hp on 2017/5/23.
 */

@Entity(name = "servicecustomer")
public class ServiceCustomer {
    private Integer svcId;
    private Integer svcCusid;
    private Integer svcNurid;
    private Integer svcStatus;
    private Integer svcPps;
    private Date svcStart;
    private Date svcEnd;
    private String svcComment;
    private Integer svcLevel;
    private Date svcDate;
    private Byte svcAble;
    private String cusName;

    @Id
    @Column(name = "svc_id", nullable = false)
    public Integer getSvcId() {
        return svcId;
    }

    public void setSvcId(Integer svcId) {
        this.svcId = svcId;
    }

    @Basic
    @Column(name = "svc_cusid", nullable = false)
    public Integer getSvcCusid() {
        return svcCusid;
    }

    public void setSvcCusid(Integer svcCusid) {
        this.svcCusid = svcCusid;
    }

    @Basic
    @Column(name = "svc_nurid", nullable = false)
    public Integer getSvcNurid() {
        return svcNurid;
    }

    public void setSvcNurid(Integer svcNurid) {
        this.svcNurid = svcNurid;
    }

    @Basic
    @Column(name = "svc_status", nullable = false)
    public Integer getSvcStatus(int svcStatus) {
        return this.svcStatus;
    }

    public void setSvcStatus(Integer svcStatus) {
        this.svcStatus = svcStatus;
    }

    @Basic
    @Column(name = "svc_pps", nullable = false)
    public Integer getSvcPps() {
        return svcPps;
    }

    public void setSvcPps(Integer svcPps) {
        this.svcPps = svcPps;
    }

    @Basic
    @Column(name = "svc_start", nullable = false)
    public Date getSvcStart() {
        return svcStart;
    }

    public void setSvcStart(Date svcStart) {
        this.svcStart = svcStart;
    }

    @Basic
    @Column(name = "svc_end", nullable = false)
    public Date getSvcEnd() {
        return svcEnd;
    }

    public void setSvcEnd(Date svcEnd) {
        this.svcEnd = svcEnd;
    }

    @Basic
    @Column(name = "svc_comment", nullable = false, length = 500)
    public String getSvcComment() {
        return svcComment;
    }

    public void setSvcComment(String svcComment) {
        this.svcComment = svcComment;
    }

    @Basic
    @Column(name = "svc_level", nullable = false)
    public Integer getSvcLevel() {
        return svcLevel;
    }

    public void setSvcLevel(Integer svcLevel) {
        this.svcLevel = svcLevel;
    }

    @Basic
    @Column(name = "svc_date", nullable = false)
    public Date getSvcDate() {
        return svcDate;
    }

    public void setSvcDate(Date svcDate) {
        this.svcDate = svcDate;
    }

    @Basic
    @Column(name = "svc_able", nullable = false)
    public Byte getSvcAble() {
        return svcAble;
    }

    public void setSvcAble(Byte svcAble) {
        this.svcAble = svcAble;
    }

    @Basic
    @Column(name = "cus_name", nullable = false, length = 20)
    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public void ServiceCustomer(Integer svcStatus,Integer svcLevel,Date svcEnd,Byte svcAble,String svcComment,Integer svcCusid,Date svcDate,Integer svcId,Integer svcPps,Date svcStart,String cusName){
           //                           s.svcStatus,  s.svcLevel,   s.svcEnd,   s.svcAble,     s.svcComment,  s.svcCusid,   s.svcDate,  s.svcId,  s.svcPps,   s.svcStart,     c.cusName
        this.setSvcStatus(svcStatus);
        this.setSvcStart(svcStart);
        this.setSvcEnd(svcEnd);
        this.setSvcCusid(svcCusid);
        this.setSvcDate(svcDate);
        this.setSvcPps(svcPps);
        this.setSvcLevel(svcLevel);
        this.setSvcComment(svcComment);
        this.setSvcId(svcId);
        this.setCusName(cusName);
        this.setSvcId(svcId);
        this.setSvcAble(svcAble);
    }
}
