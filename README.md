# TF-AnsibleTower_Installation_EC2
Hi there ✋!

We can use this terraform file to create EC2 instance and install latest version of Ansible Tower on AWS(Amazon Web Services) along with security group(with custom rules).


Requirements
------------

To execute this code successfully, we need to install terraform on our system. Please use below commands to install terraform or refer official terraform website.

&nbsp;

**_Terraform installation commands:_**
```
# dnf install -y dnf-plugins-core
# dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
# dnf install -y terraform
```

&nbsp;
>Replace few values in "terraform.tfvars" variable file.
```
ports = [22, 80, 443, 5432, 4369, 15672, 25672]
image_name = "RHEL_HA-8.4.0_HVM-*-x86_64-2-Hourly2-GP2"
instance_type = "t2.xlarge"
region = "us-east-1"
access_key = "Enter_Access_key"
secret_key = "Enter_Secret_key"
vpc_id = "vpc_id"
ansible_tower_tar_URL = "https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-latest.tar.gz"
```

&nbsp;&nbsp;

Copy publish and private ssh key file(id_rsa.pub & id_rsa).
* [x] Publish ssh key will be use to create ssh-key pair and attach with EC2 instance.
* [x] Private ssh key will be use to take ssh on EC2 instance and perform further Ansible Tower installation.

&nbsp;
>To execute terraform code file, please refer below commands.

 ```
$ terraform init                      //To download provider modules
$ terraform validate                  //To check/validate terraform code file
$ terraform plan                      //To check all setting and configuration before apply
$ terraform apply                     //To execute the code on AWS(Amazon Web Service)
```


&nbsp;&nbsp;

If you required any help, please feel free to reach out to me on email. Many Thanks 🙂



Author Information
------------------

Name: [Nikhil Jain](https://www.linkedin.com/in/mrnikhiljain)
&emsp;
Email: nikhjain@redhat.com
