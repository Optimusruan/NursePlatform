package model;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/5/16.
 */
@Entity
@Table(name = "admin", schema = "nurseplatform", catalog = "")
public class AdminEntity {
    private Integer admId;
    private String admUname;
    private String admPwd;

    @Id
    @Column(name = "adm_id", nullable = false)
    public Integer getAdmId() {
        return admId;
    }

    public void setAdmId(Integer admId) {
        this.admId = admId;
    }

    @Basic
    @Column(name = "adm_uname", nullable = false, length = 10)
    public String getAdmUname() {
        return admUname;
    }

    public void setAdmUname(String admUname) {
        this.admUname = admUname;
    }

    @Basic
    @Column(name = "adm_pwd", nullable = false, length = 20)
    public String getAdmPwd() {
        return admPwd;
    }

    public void setAdmPwd(String admPwd) {
        this.admPwd = admPwd;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdminEntity that = (AdminEntity) o;

        if (admId != null ? !admId.equals(that.admId) : that.admId != null) return false;
        if (admUname != null ? !admUname.equals(that.admUname) : that.admUname != null) return false;
        if (admPwd != null ? !admPwd.equals(that.admPwd) : that.admPwd != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = admId != null ? admId.hashCode() : 0;
        result = 31 * result + (admUname != null ? admUname.hashCode() : 0);
        result = 31 * result + (admPwd != null ? admPwd.hashCode() : 0);
        return result;
    }
}
