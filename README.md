# Terraform State Management

Terraform provides locking to prevent concurrent runs against the same state. This script will create an underlying S3 bucket and DynamoDB table in AWS.

## AWS Provider

The Amazon Web Services (AWS) provider is used in Terraform script. The AWS provider offers a flexible means of providing credentials for authentication. In this script environment variables are used.

You can use any method you prefer.

## What is Terraform state

Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

This state is stored by default in a local file named "terraform.tfstate". When working on a team, it is better to store this state file remotely so that more folks can access it to make changes to the infrastructure. With enclosing scripts you can store your Terraform state files with locking mechanism enabled. Infrastructure will be created in AWS (S3 bucket and a dyanmoDB table).

## Prerequisites

For running locally make sure you have installed:

* [AWS Command Line Interface](https://aws.amazon.com/cli/)
* [Terraform](https://www.terraform.io/) version 0.14.8 used
* [direnv](https://direnv.net/)

## Configuration files

### AWS Authentication

We are using Environment Variables for providing credentials for authentication. Template file for applying AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY can be found in `.envrc-dist` file.

Copy `.envrc-dist` to `.envrc` add the exact parameters 

* replace <AWS_ACCESS_KEY_ID> with your Access key ID
* replace <AWS_SECRET_ACCESS_KEY> with Secret access key

and let `direnv`  load environment variables.

### Terraform input variable

Input variables accepted by a module are in template file `variables.tf-dist`.

Copy `variables.tf-dist` to `variables.tf` add the replace:

* replace <S3_BUCKET_NAME> with the desired S3 bucket name
* replace <DynamoDB_TABLE_NAME> with the desired DynamoDB table name

## Provision infrastructure with Terraform

> Note: We can still run terraform commands directly!

The glue for running Terraform commands is makefile. The Makefile itself takes only one `target` command:

```bash
apply                          Creates or updates infrastructure according to Terraform configuration files in the current directory.
clean                          Removes .terraform/ folder and all tfstate files.
destroy                        Destroy Terraform-managed infrastructure.
help                           Prints help
init                           Initialize a new or existing Terraform working directory by creating initial files, loading any remote state, downloading modules, etc.
plan                           Generates a speculative execution plan, showing what actions Terraform would take to apply the current configuration. This command will not actually perform the planned actions.
validate                       Validate the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc.
```

Running `make` without any target will execute `init`, `validate`, `plan`, `apply` in that order.

Output after the infrastructure is sucesfully provisioned.

```bash
Outputs:

S3_Bucket = "<S3_BUCKET_NAME>"
```
