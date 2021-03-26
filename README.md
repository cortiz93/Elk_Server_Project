## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

**Note**: The following image link needs to be updated. Replace `diagram_filename.png` with the name of your diagram image file.  

https://github.com/cortiz93/Elk_Server_Project/blob/main/Diagrams/ELK-Diagram.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  https://github.com/cortiz93/Elk_Server_Project/blob/main/Ansible/install_elk.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly reliable/available, in addition to restricting traffic to the network.
- Load balancers help protect an organization against Denial of Service attacks and high influxes of web traffic.
- A jumpbox is a computer on a network utilized to access other devices on a the network through a secure gateway. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file systems and system metrics.
- Filebeat monitors the log files or locations you specify, collects log events and forwards them to Elastic search for indexing. 
- Metricbeat collects and records system metrics and services running on the server. 

The configuration details of each machine may be found below.

| Name       | Function   | IP Address  | Operating System |
|------------|------------|-------------|------------------|
| Jump Box   | Gateway    | 10.1.0.4    | Linux            |
| Web-1      | Web Server | 10.1.0.5    | Linux            |
| Web-2      | Web Server | 10.1.0.7    | Linux            |
| Web-3      | Web Server | 10.1.0.6    | Linux            |
| Elk-Server | Monitoring | 192.168.0.4 | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 68.101.130.83

Machines within the network can only be accessed by JumpBox.
- JumpBox (40.118.239.28) is the only machine able to access the ELKServer and Web Servers

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible | Allowed IP Addresses |
|------------|---------------------|----------------------|
| Jump Box   | Yes                 | 68.101.130.83        |
| Web-1      | No                  | 10.1.0.4             |
| Web-2      | No                  | 10.1.0.4             |
| Web-3      | No                  | 10.1.0.4             |
| Elk-Server | No                  | 10.1.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Ansible allows I.T. Admins to automate server and system configurations to create uniformity accross multiple deployments. 

The playbook implements the following tasks:
- Install docker.io
- Install python3-pip
- Install docker module
- Install and Launch a docker ELK container
- enable service docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.  

https://github.com/cortiz93/Elk_Server_Project/blob/main/Images/docker-ps.PNG

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.1.0.5
- Web-2 10.1.0.7
- Web-2 10.1.0.6

We have installed the following Beats on these machines:
- Metricbeat
- Filebeat

These Beats allow us to collect the following information from each machine:
- Filebeat detects and logs any changes to the file system. I expect to see logs from Apache.
- Metricbeat detects and logs changes in system metrics and system services uses. We use it to detect SSH logins and CPU/RAM statistics.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to ansible control node.
- Update the ansible host file to include your target VM's to run each playbook on. 
- Run the playbook, and navigate to the url Http://(insertyourELKmachinepublicIP):5601/app/kibana#/home to check that the installation worked as expected.

Follow the following steps to configure and deploy your elk container. 
- Copy the https://github.com/cortiz93/Elk_Server_Project/blob/main/Ansible/install_elk.yml file to /etc/ansbible directory
- Update your ansible.cfg and make the following changes...
  - uncomment the remote_user and set equal to Your_User_Name
- Update your ansible hosts file and make the following changes...
  - uncomment your [webservers] bracket and add ELK server private ip address with your the following line. Ex: 192.168.0.4 ansible_python_interpreter=/usr/bin/python3 
- and navigate to the url Http://(insertyourELKmachinepublicIP):5601/app/kibana#/home to check that the installation worked. Ex: https://20.64.81.214:5601/app/kibana#/home

