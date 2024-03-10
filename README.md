# OpenTofu State Management

OpenTofu is utilized for managing the state with an emphasis on security and flexibility. This script facilitates the creation of necessary resources in AWS, such as an S3 bucket, to securely store and manage state information.

## AWS Provider

The Amazon Web Services (AWS) provider is leveraged for interactions with AWS services. The AWS provider offers various methods for authentication, and this script is designed to accommodate the method you prefer for providing credentials.

## What is OpenTofu?

OpenTofu is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. You can then use a consistent workflow to provision and manage all of your infrastructure throughout its lifecycle. 

> At the moment of writing, OpenTofu acts as a drop-in replace for Terraform. That makes it really easy to migrate from Terraform to OpenTofu.

## What is Terraform state
Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

This state is stored by default in a local file named "terraform.tfstate". When working on a team, it is better to store this state file remotely so that more folks can access it to make changes to the infrastructure. With enclosing scripts you can store your Terraform state files with locking mechanism enabled. Infrastructure will be created in AWS (S3 bucket and a dyanmoDB table).

## Prerequisites

Ensure the following tools are installed for local execution:

* [AWS Command Line Interface](https://aws.amazon.com/cli/)
* [OpenTofu](https://opentofu.org/docs/intro/install/)

## Handling Environment Variables

Environment variables are used for AWS authentication among other configurations. It is up to the individual to manage these environment variables in a way that best suits their workflow and security practices.

## Configuration and Usage

### AWS Authentication

For AWS authentication, you can use environment variables or any other preferred method. Ensure that the necessary credentials (such as `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) are securely set in your environment.


### OpenTofu input variable

Input variables accepted by a module are in template file `variables.tf-dist`.

Copy `variables.tf-dist` to `variables.tf` add the replace:

* replace <S3_BUCKET_NAME> with the desired S3 bucket name
* replace <DynamoDB_TABLE_NAME> with the desired DynamoDB table name

## Provision infrastructure with OpenTofu

> Note: We can still run tofu commands directly!

The glue for running OpenTofu commands is makefile. The Makefile itself takes only one `target` command:

```bash
apply                          Creates or updates infrastructure according to OpenTofu configuration files in the current directory.
clean                          Removes .terraform/ folder and all tfstate files.
destroy                        Destroy OpenTofu-managed infrastructure.
help                           Prints help
init                           Initialize a new or existing OpenTofu working directory by creating initial files, loading any remote state, downloading modules, etc.
plan                           Generates a speculative execution plan, showing what actions OpenTofu would take to apply the current configuration. This command will not actually perform the planned actions.
validate                       Validate the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc.
```

## Outputs

Upon successful provisioning, the script will output details about the created resources, such as the S3 bucket name used for state management.

```bash
Outputs:

S3_Bucket = "<S3_BUCKET_NAME>"
```

## Contributing

Contributions are welcome! Feel free to report bugs, suggest features, improve documentation, or submit pull requests following the standard fork-and-pull request workflow.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.

## Acknowledgments

* Special thanks to all open-source libraries and contributors that make this project possible.
* Gratitude to the community for their valuable feedback and suggestions.

<div align="center">

Developed with ❤️ by Aleš Lončar

</div>
