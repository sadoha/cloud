######################################
# --- Kubernetes v1.9.4. --- #
######################################

It is a cloud which has been created using Kubernetes technology. You can use this code for creating a cloud on dedicated servers. More information about infrastructure and installation you can find below.

How to install:

First, you should install Git and Ansible (v2.4.*) software for using playbooks.

After installing the software you should update group_vars and hosts files in inventories directory, you should change parameters on existed in your infrastructure.

		├── inventories
		    └── dev
		        ├── group_vars
		        │   └── all.yml  <---
		        └── hosts        <---

After updating configurations files you should run Ansible playbooks in the following order:

		ansible-playbook -i inventories/dev/hosts kube-cluster.yml dev-containers.yml -Kk

You can use this command in the kube-master server for checking an infrastructure:

		kubectl get pv,pvc,no,po,rc,svc,rs,deployment -o wide  --all-namespaces

You can open a dashboard used this URL:

		https://kube_master_ip/

For taking the authorization token please run this command on the kube-master server:

		kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep kubernetes-dashboard-token | awk '{print $1}')

You have to run this command on the kube-master creating for creating an index.html file for Nginx. 

		echo "It Works" > /var/nfsshare/index.html

You can open a Nginx used this URL:

		http://kube_node1_ip/

