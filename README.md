# NOTICE
**!! THIS IS NOT YET COMPLETE. WORKING WITH MONGODB 5.0.9 ON UBUNTU 20.04 !!**  

# Mongodb Ansible Role
This Ansible role will deploy Mongodb replicaset for You.  

# ROADMAP
 * [ ] Fix initiate payload
 * [ ] Add Molecule
 * [ ] Improve configuration
 * [ ] Documentation
 * [ ] Add Prometheus exporter role
 * [ ] Add TLS
 * [ ] Security Hardening
 * [ ] ProxMox Packer

# Variables
**Config file related:**  
| name | description |   default |
|---   |          ---|        ---|
| _rs_name | replicaset name, `replication.replSetName` in config file. | development |
| _keyFile_path | path to put key file, `security.keyFile` in config file. | /etc/mongo.keyFile  |
| _dpPath | data directory path, `storage.dbPath` in config file. | /etc/mongo.keyFile  |
| _logVerbosity | log verbosity level ( 0 - 5 ) | 0 |
| _logPath | file path to write logs | /var/log/mongodb/mongo.log |
| _logAppend | append logs to same log file | false |
| _logRotate | strategy to rotate logs | rename |
| _address | address to listen on  | 0.0.0.0 |
| _port | port number to listen for requests | 27017 |
| _oplogSizeMB | operation log size | 8096 |
  

**Users related:**  
| name | description |   default |
|---   |          ---|        ---|
| _admin_username | default username to create after deploying database. it will have `root` role. | root |
| _admin_password | password for `_admin_username`.   | ChangeMe123  |
| _users | list of users to get created | null |
  

**Replication related:**  
| name | description |   default |
|---   |          ---|        ---|
| _targetHost | host which will be used to execute commands to initialize replicaset. | first host in mongo group |
| _initiate_payload | replicaset config to use with `rs.initiate()` | it will get created upon provided values |
| _rs_writeConcern | replicaset default write concern, `writeConcernMajorityJournalDefault` in replicaset config document. | true |
| **SET BELOEW CONFIGS FOR EACH INSTANCE** | **SET BELOEW CONFIGS FOR EACH INSTANCE** | **SET BELOEW CONFIGS FOR EACH INSTANCE**|
| _rs_isArbiter | is node arbiter | false |
| _rs_canVote | can node vote in elections | true |
| _rs_id | id for node in replicaset. If You are not sure, do NOT set it. it will get set automatically | - |
| _rs_buildIndexes | secondry nodes build indexes. | true |
| _rs_isHidden | is node a hidden replica | false |
| _rs_priority  | priority of node in replicaset | 1 |
| _rs_delay | number of seconds to set delay for secondary node | 0 |


**User template:**
```yaml
_users:
- name: username
  password: password
  database: on which database this user should get created
  roles:
  - db: dbName
    role: roleName
  - db: admin
    role: root
...
```
