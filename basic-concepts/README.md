# What is IaC?

IaC provides programmatic way to provision, manage and configure infrastructure resources. Earlier versions of IaC were built around scripts making use of relevant APIs of infrastructure providers, like writing a script to provision AWS EC2 resources using a Shell script that interacts with AWS’s API. Currently, infrastructure configurations can be provided declaratively using code files that the IaC tools can process and then provision desired infrastructure resources accordingly.

## Types of IaC Tools:
1.	Configuration management tools: 	
	- Used to install and manage software on existing infrastructure
	- Follow standard structure for configurations
	- Configurations can be saved in a version control system
	- Are idempotent, i.e., stateful, and implement only deltas with the existing state
	- Examples: Ansible, Puppet, SaltStack
2.	Server templating tools:
	- Are used to package pre-installed software and dependencies in the form of VMs, container images etc.
	- Maintain immutability in the infrastructure
	- Examples:	Docker, Packer, Vagrant
3.	Provisioning tools:
	- Deploy immutable infrastructure resources
	- Can provision different kinds of resources, e.g., servers, databases, network components etc.
	- Examples: Terraform, Cloud Formation

# Terraform
Terraform can deploy infrastructure across different clouds (including on-premises) as well as provision resources offered by different DB providers, networking providers, data platform providers etc.
Terraform can also manage physical servers of on-prem cloud. It uses HCL syntax to let users describe declarative configurations of desired infrastructure resources. 
There are different types of resources that can be managed by Terraform, e.g., files, VMs, IAM roles, DB bucket etc.


## Provisioning stages 
There are three phases of Terraform infrastucture provisinoing: init, plan and apply.
- **init**: initializes terraform providers, (remote) state backends etc.
- **plan**: reads desired configurations from `.tf` files, compares them with current state of the infrastructure and plans necessary actions to be taken in order to match the actual state with the desired state.
- **apply**: applies planned out actions of the previous stage.

## HCL Basics
Below is the basic syntax of HCL:
```
<block> <parameters> {
	Key1 = value1
	Key2 = value2
}
```

A block contains information about infrastructure platform and set of resources within that platform using the following format:
```
<Block name, e.g., resource> <resource type> <resource name> {
	// resource specific arguments
	Key1 =  value1
	Key2 =  value2
}
```
For example:
```yaml
resource “aws_instance” “webserver”{
	// resource specific arguments
	Key1 =  value1
	Key2 =  value2
}
```

## Basic workflow
Infrastructure provisioning and management using Terraform follows this workflow:
1. Write declarative configurations in terraform config files (`xyz.tf`) 
2. Perform terraform provisioning stages (init -> plan -> apply)
	-	`terraform init`
	-	`terraform plan` (similar to diff command in git) 
	-	`terraform apply` (displays the execution plan and asks for confirmation)
	-	`terraform show` (displays the list of resources)

### Update and Destroy Infrastructure resources
Existing resources can be modified by updating their desired configurations in the `.tf` config files. In this case, terraform will first delete the existing resource and then recreate it with updated configurations. -/+ symbol in the ‘terraform plan’ output indicates that a resource must be first deleted and then recreated. 

Running `terraform destroy` command will destroy existing resources being managed by Terraform.

## Terraform Documentation
[Terraform docs](https://developer.hashicorp.com/terraform/docs) provide information about different Terraform providers, the resources they offer and the arguments required for those resources.


