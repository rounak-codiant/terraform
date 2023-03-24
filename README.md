Terraform
=========

- Website: https://www.terraform.io
- Forums: [HashiCorp Discuss](https://discuss.hashicorp.com/c/terraform-core)
- Documentation: [https://www.terraform.io/docs/](https://www.terraform.io/docs/)
- Tutorials: [HashiCorp's Learn Platform](https://learn.hashicorp.com/terraform)
- Certification Exam: [HashiCorp Certified: Terraform Associate](https://www.hashicorp.com/certification/#hashicorp-certified-terraform-associate)

<img alt="Terraform" src="https://www.datocms-assets.com/2885/1629941242-logo-terraform-main.svg" width="600px">


### Provider and Version
    source  = hashicorp/aws
    version = 4.48.0

-------------------------------

#### Terraform Commands:
The available commands for execution are listed below.
The primary workflow commands are given first, followed by less common or more advanced commands
###### Main commands:

```
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure
```
######  All other commands:

```
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  test          Experimental support for module integration testing
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management
```
###### Global options (use these before the subcommand, if any):
```
 -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.

```
-------------------------------

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

The key features of Terraform are:

- **Infrastructure as Code**: Infrastructure is described using a high-level configuration syntax. This allows a blueprint of your datacenter to be versioned and treated as you would any other code. Additionally, infrastructure can be shared and re-used.

- **Execution Plans**: Terraform has a "planning" step where it generates an *execution plan*. The execution plan shows what Terraform will do when you call apply. This lets you avoid any surprises when Terraform manipulates infrastructure.

- **Resource Graph**: Terraform builds a graph of all your resources, and parallelizes the creation and modification of any non-dependent resources. Because of this, Terraform builds infrastructure as efficiently as possible, and operators get insight into dependencies in their infrastructure.

- **Change Automation**: Complex changesets can be applied to your infrastructure with minimal human interaction. With the previously mentioned execution plan and resource graph, you know exactly what Terraform will change and in what order, avoiding many possible human errors.

For more information, see the [introduction section](https://www.terraform.io/intro) of the Terraform website.

Getting Started & Documentation
-------------------------------
Documentation is available on the [Terraform website](https://www.terraform.io):
  - [Intro](https://www.terraform.io/intro/index.html)
  - [Docs](https://www.terraform.io/docs/index.html)

If you're new to Terraform and want to get started creating infrastructure, please check out our [Getting Started guides](https://learn.hashicorp.com/terraform#getting-started) on HashiCorp's learning platform. There are also [additional guides](https://learn.hashicorp.com/terraform#operations-and-development) to continue your learning.

Show off your Terraform knowledge by passing a certification exam. Visit the [certification page](https://www.hashicorp.com/certification/) for information about exams and find [study materials](https://learn.hashicorp.com/terraform/certification/terraform-associate) on HashiCorp's learning platform.

Developing Terraform
--------------------

This repository contains only Terraform core, which includes the command line interface and the main graph engine. Providers are implemented as plugins, and Terraform can automatically download providers that are published on [the Terraform Registry](https://registry.terraform.io). HashiCorp develops some providers, and others are developed by other organizations. For more information, see [Extending Terraform](https://www.terraform.io/docs/extend/index.html).

To learn more about compiling Terraform and contributing suggested changes, please refer to [the contributing guide](.github/CONTRIBUTING.md).

To learn more about how we handle bug reports, please read the [bug triage guide](./BUGPROCESS.md).

## Terraform Instructions:

```
To apply this script you have to follow below instructions:
```

-------------------------------

### Step1: Terraform Backend Configuration & Update Variables
```
1. Create a S3 bucket in your selected region.
2. Create DynamoDB table.
3. Configure AWS profile on local with this command
       aws configure --profile projectname

4. Create a terraform.tfvars file from terraform.tfvars.example file.
5. Update the required values in provider.tf file.
       Note: You can select Method 1 by uncommenting it.
6. Update the variable's values in terraform.tfvars files as per your need.

```
## Reference Link: 
- [To create Bucket and DynamoDB table ](https://www.golinuxcloud.com/configure-s3-bucket-as-terraform-backend/)
- [To Configure AWS Profile ](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html/)
-------------------------------
### Step2: To Create All Resources
```
1. terraform init
2. terraform plan -var-file=terraform.tfvars
3. terraform apply -var-file=terraform.tfvars
```
-------------------------------

### To Create Specific Modules/Resources.

```
1. terraform init
2. terraform plan -var-file=terraform.tfvars -target=module.vpc
3. terraform apply -var-file=terraform.tfvars -target=module.vpc
```
-------------------------------

### Step3: To Destroy/Delete All Resources.
```
1. terraform destroy -var-file=terraform.tfvars
```
-------------------------------

### To Destroy/Delete Specific Modules/Resources.
```
terraform destroy -var-file=terraform.tfvars -target=module.vpc
```

-------------------------------

## License
<p align="center">
<a href="https://www.codiant.com/"><img src="https://www.codiant.com/assets/images/codiant-logo.svg" width="400"></a>
</p>
