------------------------------------------------------   
# THE ENTERPRISE IT CHECKLIST FOR DOCKER OPERATIONS 
         
Version:17.06

Source: https://github.com/nicolaka/checklist

------------------------------------------------------

## ☑ Infrastructure 

* Cluster Sizing and Zoning
* Supported and Compatible ( OS, Docker Engine, UCP, DTR) 
* Adequate Resource ( Manager vs Worker Nodes)
    * Manager: 16G mem, 4 vCPU, 1+ Gbps, 32+ GB disk
    * Worker(minimum): 4G mem, 2 vCPU, 100+ Mbps, 8 GB disk
* Resources
    * [Compatibility Matrix](https://success.docker.com/Policies/Compatibility_Matrix)
    * [System Requirements](https://success.docker.com/article/Docker_Reference_Architecture-_Docker_EE_Best_Practices_and_Design_Considerations_17_03#astandarddeploymentarchitecture)

## ☑ Orchestration Management

 * Redundant/Highly Available UCP managers 
 * Deployed in odd numbers (3,5,7) to maintain quorum
 * Distributed across data centers or availability zones (1-1-1, 2-2-1..etc)
 * Fine-tuned orchestration settings
 * Upstream TCP load balancing 
 * No application workloads on managers
 * Automated join and leave process 
 * Labeled resources (networks, volumes, containers, services, secrets, nodes)
 * Resources
         * [Docker EE Reference Architecture](https://success.docker.com/article/Docker_Reference_Architecture-_Docker_EE_Best_Practices_and_Design_Considerations_17_03#astandarddeploymentarchitecture)
         * [UCP Architecture](https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/)
         * [Limiting Application Deployment Workers](https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/)
         * [Resource Labeling](https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/add-labels-to-cluster-nodes/)

## ☑ Image Distribution

* Redundant (3,5,7) DTR Replicas 
* Replicated and secured image backend storage (NFS, S3, Azure Storage…etc)
* Garbage collection enabled
* Security scanning enabled
* Resources
    * [Docker EE Reference Architecture](https://success.docker.com/article/Docker_Reference_Architecture-_Docker_EE_Best_Practices_and_Design_Considerations_17_03#astandarddeploymentarchitecture)
    * [DTR High Availability](https://docs.docker.com/datacenter/dtr/2.3/guides/admin/configure/set-up-high-availability/)
    * [Security Scanning](https://docs.docker.com/datacenter/dtr/2.3/guides/admin/configure/set-up-vulnerability-scans/)
    * [Garbage Collection](https://docs.docker.com/datacenter/dtr/2.3/guides/admin/configure/garbage-collection/)

## ☑ Security 

* Utilize Docker EE RBAC Model ( Subjects, Grants, Roles, Collection, Resource)
* AD/LDAP groups mapped to teams and organizations 
* Docker Content Trust Signing and Enforcement
* Regular Run of Docker Security Bench 
* Restricted direct access (SSH/RDP) 
* Utilize built-in Secrets functionality (encrypted, controlled)
* Rotate orchestration join keys
* Use built-in or internal CA
* Resources:
    * [Security Reference Architecture](https://success.docker.com/article/Docker_Reference_Architecture-_Securing_Docker_EE_and_Security_Best_Practices)
    * [Docker Security Bench](https://github.com/docker/docker-bench-security)
    * [Docker EE RBAC Example Use-Case ](https://success.docker.com/article/RBAC_Example-Overview)
    * [Docker Secrets](https://docs.docker.com/engine/swarm/secrets/)
    * [Introduction to User Namespaces in Docker Engine](https://success.docker.com/article/Introduction_to_User_Namespaces_in_Docker_Engine)

## ☑ Network

* Pick right networking driver for your application 
* Select proper publishing mode ( Ingress vs. Host Mode)
* Pick suitable load-balancing mode ( client side = dnsrr, server-side = vip)
* Network latency < 100ms
* Segment App at L3 with Overlays (1 App  1 Overlay Network)
* Utilize built-in encrypted overlay feature ( app <--> app encrypted)
* Pick the application subnet size carefully 
* Designated non-overlapping subnets to be used by Docker for overlay networks 
* Resources:
    * [Networking Reference Architecture](https://success.docker.com/article/Docker_Reference_Architecture-_Designing_Scalable,_Portable_Docker_Container_Networks)
    * [Service Discovery and Loadbalancing Reference Architecture](https://success.docker.com/article/Docker_Reference_Architecture-_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing)

## ☑ Storage 

* Production-ready configured engine storage backend 
* Replicated and secure DTR storage backend
* Certified and tested application data storage plugin for replicating application data 
* Resources:
    * [Configure Devicemapper for Production](https://docs.docker.com/engine/userguide/storagedriver/device-mapper-driver/)
    * [DTR Storage Backend](https://docs.docker.com/datacenter/dtr/2.3/guides/admin/configure/external-storage/)

## ☑ Logging and Monitoring

* External centralized logging for engine and application containers logs
* Local logging for active trouble-shooting 
* Host-level and container-level resource monitoring
* DTR image backend storage monitoring
* Docker engine storage monitoring
* Use built-in application health checking functionality
* Resources:
    - [Logging Reference Architecture](https://success.docker.com/article/Docker_Reference_Architecture-_Docker_Logging_Design_and_Best_Practices)

## ☑ Integration

* UCP and DTR are well integrated ( SSO, DCT..etc)
* CI/CD tooling ( Jenkins, Bamboo, CircleCI..etc)
* Development tooling (dev machines, IDEs)
* Configuration automation tools (Puppet, Chef, Ansible, Salt)
* Resource provisioning systems (Terraform..etc)
* Change management systems
* Internal/external DNS or other service discovery and registration systems
* Load balancing for both the management plane and each of the applications ( L4/L7)
* Incident/ticketing management systems (ServiceNow..etc)

 
## ☑ Disaster Recovery

* Regular (rec. weekly) backups (UCP, DTR, and Swarm)
* Well-tested, automated, and documented
    * platform restoration
    * upgrade + downgrade
    * application recovery procedure
* Resources:
    * [Entire Docker EE Upgrade Procedure](https://success.docker.com/article/Upgrade_an_entire_cluster_with_CentOS,_Docker_Engine,_UCP,_and_DTR)
    * [DTR Backup and Recovery](https://docs.docker.com/datacenter/dtr/2.3/guides/admin/backups-and-disaster-recovery/)
    * [UCP Backup and Recovery](https://docs.docker.com/datacenter/ucp/2.2/guides/admin/backups-and-disaster-recovery/)
    * [Swarm Backup and Recovery](https://docs.docker.com/engine/swarm/admin_guide/#recover-from-disaster)

## ☑ Testing

* Multi-platform image pull and push to DTR
* Confirm users have the right set of access to their respective resources
* Confirm application resource limitation works as expected
* End-to-end stack deployment from CLI and UI
* Updating applications with new configuration, images, networks using rolling upgrade

















