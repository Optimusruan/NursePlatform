package model.mapModel;

import java.util.Date;

/**
 * Created by hp on 2017/5/23.
 */


public class ServiceCustomerMapping {
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

    public ServiceCustomerMapping(Integer svcId, Integer svcCusid, Integer svcNurid, Integer svcStatus, Integer svcPps, Date svcStart, Date svcEnd, String svcComment, Integer svcLevel, Date svcDate, Byte svcAble, String cusName) {
        this.svcId = svcId;
        this.svcCusid = svcCusid;
        this.svcNurid = svcNurid;
        this.svcStatus = svcStatus;
        this.svcPps = svcPps;
        this.svcStart = svcStart;
        this.svcEnd = svcEnd;
        this.svcComment = svcComment;
        this.svcLevel = svcLevel;
        this.svcDate = svcDate;
        this.svcAble = svcAble;
        this.cusName = cusName;
    }

    public ServiceCustomerMapping() {
    }

    public Integer getSvcId() {
        return svcId;
    }

    public void setSvcId(Integer svcId) {
        this.svcId = svcId;
    }

    public Integer getSvcCusid() {
        return svcCusid;
    }

    public void setSvcCusid(Integer svcCusid) {
        this.svcCusid = svcCusid;
    }

    public Integer getSvcNurid() {
        return svcNurid;
    }

    public void setSvcNurid(Integer svcNurid) {
        this.svcNurid = svcNurid;
    }

    public Integer getSvcStatus() {
        return svcStatus;
    }

    public void setSvcStatus(Integer svcStatus) {
        this.svcStatus = svcStatus;
    }

    public Integer getSvcPps() {
        return svcPps;
    }

    public void setSvcPps(Integer svcPps) {
        this.svcPps = svcPps;
    }

    public Date getSvcStart() {
        return svcStart;
    }

    public void setSvcStart(Date svcStart) {
        this.svcStart = svcStart;
    }

    public Date getSvcEnd() {
        return svcEnd;
    }

    public void setSvcEnd(Date svcEnd) {
        this.svcEnd = svcEnd;
    }

    public String getSvcComment() {
        return svcComment;
    }

    public void setSvcComment(String svcComment) {
        this.svcComment = svcComment;
    }

    public Integer getSvcLevel() {
        return svcLevel;
    }

    public void setSvcLevel(Integer svcLevel) {
        this.svcLevel = svcLevel;
    }

    public Date getSvcDate() {
        return svcDate;
    }

    public void setSvcDate(Date svcDate) {
        this.svcDate = svcDate;
    }

    public Byte getSvcAble() {
        return svcAble;
    }

    public void setSvcAble(Byte svcAble) {
        this.svcAble = svcAble;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }
}
