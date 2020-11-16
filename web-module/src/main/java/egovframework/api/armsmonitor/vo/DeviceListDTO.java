package egovframework.api.armsmonitor.vo;

/**
 * Created by Administrator on 2020-11-08.
 */
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "T_ARMS_MONITOR_DEVICELIST")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_ARMS_MONITOR_DEVICELIST", allocationSize = 1)
public class DeviceListDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public DeviceListDTO() {
        super();
    }

    @Getter @Setter
    private String c_monitor_name;
    @Getter @Setter
    private String c_monitor_url_filebeat;
    @Getter @Setter
    private String c_monitor_url_packetbeat;
    @Getter @Setter
    private String c_monitor_url_heartbeat;
    @Getter @Setter
    private String c_monitor_url_metricbeat;
    @Getter @Setter
    private String c_monitor_url_topbeat;
    @Getter @Setter
    private String c_monitor_url_apm;
    @Getter @Setter
    private String c_monitor_url_scouter;

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof DeviceListDTO) {
            //this.setC_link(((DeviceListDTO) paramInstance).getC_link());
        }
    }
}
