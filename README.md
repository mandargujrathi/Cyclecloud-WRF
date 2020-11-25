# Leveraging Azure HPC for Weather Research and Forecasting (WRF)

This repository will provide the steps to deploy and use WRF (Weather Research and Forecasting) on Azure leveraging Azure VM's for High Performance Computing. 
This deployment will feature the following: \
(1) A low cost Linux Head node (XRDP-enabled) to launch jobs onto the Linux Compute nodes integrated with a PBS Scheduler. \
(2) The Linux compute nodes leverage the HBv2 machines featuring 200 Gb/sec Mellanox HDR InfiniBand. \
(3) Automatic scale down feature integrated in the deployment enables cost optimisation: scales the VM's down (and stops charging) when the job is complete. 

## Pre-requisites

(1) Azure Subscription \
(2) Subscription whitelisted for Azure NetApp Files (ANF) \
(3) Quota for HBv2 VM's in the Azure region of your choice 

### Services used
(1) Azure Cycle Cloud \
(2) Azure NetApp Files (ANF) 

## Architecture
Following is the architecture which was developed to deploy Fluent leveraging a Linux Cluster from Windows Front End. 

![alt text](https://github.com/mandargujrathi/Cyclecloud-WRF/blob/main/Images/WRF_1.PNG)


## Deploy Azure CycleCloud
Azure CycleCloud is a free application that provides a simple, secure, and scalable way to manage compute and storage resources for HPC and Big Compute workloads.

(1) The Azure portal has a marketplace image to deploy Azure CycleCloud. The link below outlines the steps to deploy Azure CycleCloud. \
https://docs.microsoft.com/en-us/azure/cyclecloud/qs-install-marketplace?view=cyclecloud-8

(2) On the Azure bash or Windows Subsystem for Linux, install the CycleCloud CLI \
https://docs.microsoft.com/en-us/azure/cyclecloud/how-to/install-cyclecloud-cli?view=cyclecloud-8

## Deploy Azure NetApp Files
The steps below outline the process to deploy a NFS4.1 volume using Azure NetApp Files. This will be used as common share to the Windows and Linux nodes.
**This volume needs to be deployed in the same VNet as Azure CycleCloud.** 

(1) Create a NetApp Account: https://docs.microsoft.com/en-us/azure/azure-netapp-files/azure-netapp-files-quickstart-set-up-account-create-volumes?tabs=azure-portal#create-a-netapp-account 

(2) Set up a Capacity Pool: https://docs.microsoft.com/en-us/azure/azure-netapp-files/azure-netapp-files-quickstart-set-up-account-create-volumes?tabs=azure-portal#set-up-a-capacity-pool 

(3) Create a NFS Volume: https://docs.microsoft.com/en-us/azure/azure-netapp-files/azure-netapp-files-quickstart-set-up-account-create-volumes?tabs=azure-portal#create-nfs-volume-for-azure-netapp-files

## Deploy a CycleCloud Project for ANSYS Fluent. 
(1) Download the **WRF** project folder from this repository to Azure bash environment. \
(2) Upload the folder to your cyclecloud locker, using cyclecloud project upload <locker-name> \
(3) Change the directory to WRF/templates and upload the template to cyclecloud using \
  cyclecloud import_template -f wrf.txt \
(4) The cluster for WRF will now appear in the CycleCloud portal as PBS-ANSYS. \
  ![alt text](https://github.com/mandargujrathi/CycleCloud-Fluent-Win-Linux/blob/main/WRF_Cluster.PNG)
(5) To start the cluster: 
  
(a) Click on the WRF logo, enter a name for the cluster and click Next \
  ![alt text](https://github.com/mandargujrathi/Cyclecloud-WRF/blob/main/Images/WRF_2.PNG) 
  

(b) Select the VM's for master node and compute nodes. Make sure the Auto-Scaling check box is selected and enter the maximum number of core counts for the cluster. In the Networking section, select the Compute subnet (not the storage) and click Next \
     ![alt text](https://github.com/mandargujrathi/Cyclecloud-WRF/blob/main/Images/WRF_3.PNG) 
     

(c)  Make sure the settings appear as per this page and click Save \
    ![alt text](https://github.com/mandargujrathi/Cyclecloud-WRF/blob/main/Images/WRF_4.PNG) 
    

(d) The cluster will appear on the list, click on the Start button to start the master node of the cluster. \
    ![alt text](https://github.com/mandargujrathi/Cyclecloud-WRF/blob/main/Images/WRF_5.PNG) 
    

(e) Connect (SSH in) to the head node from Azure bash and check whether the ANF volume is mounted. \
![alt text](https://github.com/mandargujrathi/Cyclecloud-WRF/blob/main/Images/WRF_6.PNG) 


(f) Should you need to use the head node as XRDP, you can set a password to log in as interactive mode. \
Note: You will need to go to the Azure Resource Group for WRF, find the master node, navigate to Networking and open up port 3389 to enable RDP. 
![alt text](https://github.com/mandargujrathi/Cyclecloud-WRF/blob/main/Images/WRF_7.PNG) 


(g) 
