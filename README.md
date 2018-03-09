##############################
# --- Kubernetes v1.9.3. --- #
##############################

It is a cloud which has been created using Kubernetes technology. You can use this code for creating a cloud on dedicated servers. More information about infrastructure and installation you can find below.

How to install:

First, you should install Git and Ansible software for using Ansible (v2.4.*) playbooks.

After installing the software you should update group_vars and hosts files in inventories directory, you should change parameters on existed in your infrastructure.

		├── inventories
		    └── dev
		        ├── group_vars
		        │   └── all.yml
		        └── hosts

After updating configurations files you should run Ansible playbooks in the following order:

		ansible-playbook -i inventories/dev/hosts kube-cluster.yaml --ask-pass --ask-sudo-pass 
