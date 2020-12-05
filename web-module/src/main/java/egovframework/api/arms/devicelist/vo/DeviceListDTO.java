package egovframework.api.arms.devicelist.vo;

/**
 * Created by Administrator on 2020-11-08.
 */

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "T_ARMS_MONITOR_DEVICELIST")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_ARMS_MONITOR_DEVICELIST", allocationSize = 1)
public class DeviceListDTO extends JsTreeHibernateSearchDTO implements Serializable {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    public DeviceListDTO() {
        super();
    }

    //@Getter @Setter
    @Column(name = "c_monitor_name")
    private String c_monitor_name;

    @Column(name = "c_monitor_update_date")
    private String c_monitor_update_date;

    @Column(name = "c_monitor_update_beatname")
    private String c_monitor_update_beatname;

    @Column(name = "c_monitor_device_hostname")
    private String c_monitor_device_hostname;

    @Column(name = "c_monitor_device_ip")
    private String c_monitor_device_ip;

    @Column(name = "c_monitor_url_filebeat")
    private String c_monitor_url_filebeat;

    @Column(name = "c_monitor_url_topbeat")
    private String c_monitor_url_topbeat;

    @Column(name = "c_monitor_url_metricbeat")
    private String c_monitor_url_metricbeat;

    @Column(name = "c_monitor_url_packetbeat")
    private String c_monitor_url_packetbeat;

    @Column(name = "c_monitor_url_heartbeat")
    private String c_monitor_url_heartbeat;

    @Column(name = "c_monitor_url_apm")
    private String c_monitor_url_apm;

    @Column(name = "c_monitor_url_scouter")
    private String c_monitor_url_scouter;

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof DeviceListDTO) {
            //this.setC_link(((DeviceListDTO) paramInstance).getC_link());
        }
    }

    public String getC_monitor_name() {
        return c_monitor_name;
    }

    public void setC_monitor_name(String c_monitor_name) {
        this.c_monitor_name = c_monitor_name;
    }

    public String getC_monitor_update_date() {
        return c_monitor_update_date;
    }

    public void setC_monitor_update_date(String c_monitor_update_date) {
        this.c_monitor_update_date = c_monitor_update_date;
    }

    public String getC_monitor_update_beatname() {
        return c_monitor_update_beatname;
    }

    public void setC_monitor_update_beatname(String c_monitor_update_beatname) {
        this.c_monitor_update_beatname = c_monitor_update_beatname;
    }

    public String getC_monitor_device_hostname() {
        return c_monitor_device_hostname;
    }

    public void setC_monitor_device_hostname(String c_monitor_device_hostname) {
        this.c_monitor_device_hostname = c_monitor_device_hostname;
    }

    public String getC_monitor_device_ip() {
        return c_monitor_device_ip;
    }

    public void setC_monitor_device_ip(String c_monitor_device_ip) {
        this.c_monitor_device_ip = c_monitor_device_ip;
    }

    public String getC_monitor_url_filebeat() {
        return c_monitor_url_filebeat;
    }

    public void setC_monitor_url_filebeat(String c_monitor_url_filebeat) {
        this.c_monitor_url_filebeat = c_monitor_url_filebeat;
    }

    public String getC_monitor_url_topbeat() {
        return c_monitor_url_topbeat;
    }

    public void setC_monitor_url_topbeat(String c_monitor_url_topbeat) {
        this.c_monitor_url_topbeat = c_monitor_url_topbeat;
    }

    public String getC_monitor_url_metricbeat() {
        return c_monitor_url_metricbeat;
    }

    public void setC_monitor_url_metricbeat(String c_monitor_url_metricbeat) {
        this.c_monitor_url_metricbeat = c_monitor_url_metricbeat;
    }

    public String getC_monitor_url_packetbeat() {
        return c_monitor_url_packetbeat;
    }

    public void setC_monitor_url_packetbeat(String c_monitor_url_packetbeat) {
        this.c_monitor_url_packetbeat = c_monitor_url_packetbeat;
    }

    public String getC_monitor_url_heartbeat() {
        return c_monitor_url_heartbeat;
    }

    public void setC_monitor_url_heartbeat(String c_monitor_url_heartbeat) {
        this.c_monitor_url_heartbeat = c_monitor_url_heartbeat;
    }

    public String getC_monitor_url_apm() {
        return c_monitor_url_apm;
    }

    public void setC_monitor_url_apm(String c_monitor_url_apm) {
        this.c_monitor_url_apm = c_monitor_url_apm;
    }

    public String getC_monitor_url_scouter() {
        return c_monitor_url_scouter;
    }

    public void setC_monitor_url_scouter(String c_monitor_url_scouter) {
        this.c_monitor_url_scouter = c_monitor_url_scouter;
    }
}
