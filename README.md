It is a cloud which has been created using Kubernetes technology. You can use this code for creating a cloud on dedicated servers. More information about infrastructure and installation you can find below.

How to install:

First, you should install git and Ansible software for using Ansible playbooks.  Please run next command in command line: 
	
    yum install epel-release -y && yum install git ansible -y

After installing the software you should update vars and hosts files in inventories directory, you should change parameters on existed in your infrastructure. 

	  https://github.com/sadoha/cloud/blob/master/inventories/QA/group_vars/all.yml
	  https://github.com/sadoha/cloud/blob/master/inventories/QA/hosts

After updating configurations files you should run Ansible playbooks in the following order:

set up infrastructure before cloud installation. 
    
	  ansible-playbook -i inventories/QA/hosts pre-install-configuration.yaml 

set up the NFS server with zabbix agent. 
     
	  ansible-playbook -i inventories/QA/hosts nfs-server.yaml

set up the Kubernetes master with zabbix agent and zabbix server.
    
	  ansible-playbook -i inventories/QA/hosts kube-master.yaml

set up Kubernetes nodes zabbix agents.
    
	  ansible-playbook -i inventories/QA/hosts kube-node.yaml

set up containers. There are registry, registry-UI, PostgreSQL, nginx, mongodb containers.
    
	  ansible-playbook -i inventories/QA/hosts containers.yaml

You can use these urls for checking if infrastructure works:

Registry-UI

	  http://{{ master_IP }}:8888

Zabbix:

	  http://{{ master_IP }}: 9999

Nginx:

	  http://{{ master_IP }}
