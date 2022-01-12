Insert into T_ARMS_MONITOR_DEVICELIST
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT,
   C_LEVEL, C_TITLE, C_TYPE,
   c_monitor_name, c_monitor_update_date, c_monitor_update_beatname, c_monitor_device_hostname, c_monitor_device_ip,
   c_monitor_url_filebeat, c_monitor_url_packetbeat, c_monitor_url_heartbeat, c_monitor_url_metricbeat,
   c_monitor_url_topbeat, c_monitor_url_apm, c_monitor_url_scouter)
Values
  (1, 0, 0, 1, 8,
   0, 'Root Node', 'root',
   'c_monitor_name', 'c_monitor_update_date', 'c_monitor_update_beatname', 'c_monitor_device_hostname', 'c_monitor_device_ip',
   'c_monitor_url_filebeat', 'c_monitor_url_packetbeat', 'c_monitor_url_heartbeat', 'c_monitor_url_metricbeat',
   'c_monitor_url_topbeat', 'c_monitor_url_apm', 'c_monitor_url_scouter');
Insert into T_ARMS_MONITOR_DEVICELIST
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT,
   C_LEVEL, C_TITLE, C_TYPE,
   c_monitor_name, c_monitor_update_date, c_monitor_update_beatname, c_monitor_device_hostname, c_monitor_device_ip,
   c_monitor_url_filebeat, c_monitor_url_packetbeat, c_monitor_url_heartbeat, c_monitor_url_metricbeat,
   c_monitor_url_topbeat, c_monitor_url_apm, c_monitor_url_scouter)
Values
  (2, 1, 0, 2, 7,
   1, 'First Child', 'drive',
   'c_monitor_name', 'c_monitor_update_date', 'c_monitor_update_beatname', 'c_monitor_device_hostname', 'c_monitor_device_ip',
   'c_monitor_url_filebeat', 'c_monitor_url_packetbeat', 'c_monitor_url_heartbeat', 'c_monitor_url_metricbeat',
   'c_monitor_url_topbeat', 'c_monitor_url_apm', 'c_monitor_url_scouter');
Insert into T_ARMS_MONITOR_DEVICELIST
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT,
   C_LEVEL, C_TITLE, C_TYPE,
   c_monitor_name, c_monitor_update_date, c_monitor_update_beatname, c_monitor_device_hostname, c_monitor_device_ip,
   c_monitor_url_filebeat, c_monitor_url_packetbeat, c_monitor_url_heartbeat, c_monitor_url_metricbeat,
   c_monitor_url_topbeat, c_monitor_url_apm, c_monitor_url_scouter)
Values
  (3, 2, 0, 3, 4,
   2, 'Leaf Node', 'default',
   'c_monitor_name', 'c_monitor_update_date', 'c_monitor_update_beatname', 'c_monitor_device_hostname', 'c_monitor_device_ip',
   'c_monitor_url_filebeat', 'c_monitor_url_packetbeat', 'c_monitor_url_heartbeat', 'c_monitor_url_metricbeat',
   'c_monitor_url_topbeat', 'c_monitor_url_apm', 'c_monitor_url_scouter');
Insert into T_ARMS_MONITOR_DEVICELIST
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT,
   C_LEVEL, C_TITLE, C_TYPE,
   c_monitor_name, c_monitor_update_date, c_monitor_update_beatname, c_monitor_device_hostname, c_monitor_device_ip,
   c_monitor_url_filebeat, c_monitor_url_packetbeat, c_monitor_url_heartbeat, c_monitor_url_metricbeat,
   c_monitor_url_topbeat, c_monitor_url_apm, c_monitor_url_scouter)
Values
  (4, 2, 1, 5, 6,
   2, 'Branch Node', 'folder',
   'c_monitor_name', 'c_monitor_update_date', 'c_monitor_update_beatname', 'c_monitor_device_hostname', 'c_monitor_device_ip',
   'c_monitor_url_filebeat', 'c_monitor_url_packetbeat', 'c_monitor_url_heartbeat', 'c_monitor_url_metricbeat',
   'c_monitor_url_topbeat', 'c_monitor_url_apm', 'c_monitor_url_scouter');
COMMIT;