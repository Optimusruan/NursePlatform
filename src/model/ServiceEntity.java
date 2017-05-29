package model;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by Administrator on 2017/5/29.
 */
@Entity
@Table(name = "service", schema = "nurseplatform", catalog = "")
public class ServiceEntity {
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
    public Integer getSvcStatus() {
        return svcStatus;
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
    @Column(name = "svc_comment", nullable = true, length = 500)
    public String getSvcComment() {
        return svcComment;
    }

    public void setSvcComment(String svcComment) {
        this.svcComment = svcComment;
    }

    @Basic
    @Column(name = "svc_level", nullable = true)
    public Integer getSvcLevel() {
        return svcLevel;
    }

    public void setSvcLevel(Integer svcLevel) {
        this.svcLevel = svcLevel;
    }

    @Basic
    @Column(name = "svc_date", nullable = true)
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ServiceEntity that = (ServiceEntity) o;

        if (svcId != null ? !svcId.equals(that.svcId) : that.svcId != null) return false;
        if (svcCusid != null ? !svcCusid.equals(that.svcCusid) : that.svcCusid != null) return false;
        if (svcNurid != null ? !svcNurid.equals(that.svcNurid) : that.svcNurid != null) return false;
        if (svcStatus != null ? !svcStatus.equals(that.svcStatus) : that.svcStatus != null) return false;
        if (svcPps != null ? !svcPps.equals(that.svcPps) : that.svcPps != null) return false;
        if (svcStart != null ? !svcStart.equals(that.svcStart) : that.svcStart != null) return false;
        if (svcEnd != null ? !svcEnd.equals(that.svcEnd) : that.svcEnd != null) return false;
        if (svcComment != null ? !svcComment.equals(that.svcComment) : that.svcComment != null) return false;
        if (svcLevel != null ? !svcLevel.equals(that.svcLevel) : that.svcLevel != null) return false;
        if (svcDate != null ? !svcDate.equals(that.svcDate) : that.svcDate != null) return false;
        if (svcAble != null ? !svcAble.equals(that.svcAble) : that.svcAble != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = svcId != null ? svcId.hashCode() : 0;
        result = 31 * result + (svcCusid != null ? svcCusid.hashCode() : 0);
        result = 31 * result + (svcNurid != null ? svcNurid.hashCode() : 0);
        result = 31 * result + (svcStatus != null ? svcStatus.hashCode() : 0);
        result = 31 * result + (svcPps != null ? svcPps.hashCode() : 0);
        result = 31 * result + (svcStart != null ? svcStart.hashCode() : 0);
        result = 31 * result + (svcEnd != null ? svcEnd.hashCode() : 0);
        result = 31 * result + (svcComment != null ? svcComment.hashCode() : 0);
        result = 31 * result + (svcLevel != null ? svcLevel.hashCode() : 0);
        result = 31 * result + (svcDate != null ? svcDate.hashCode() : 0);
        result = 31 * result + (svcAble != null ? svcAble.hashCode() : 0);
        return result;
    }
}
