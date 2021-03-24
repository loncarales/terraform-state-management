SHELL := /usr/bin/env bash

NDEF = $(if $(value $(1)),,$(error $(1) not set))

all: init validate plan apply

.PHONY: init
init: ## Initialize a new or existing Terraform working directory by creating initial files, loading any remote state, downloading modules, etc.
	@terraform init

.PHONY: validate
validate: ## Validate the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc.
	@terraform validate

.PHONY: plan
plan: ## Generates a speculative execution plan, showing what actions Terraform would take to apply the current configuration. This command will not actually perform the planned actions.
	@terraform plan

.PHONY: apply
apply: ## Creates or updates infrastructure according to Terraform configuration files in the current directory.
	@terraform apply -auto-approve

.PHONY: destroy
destroy: ## Destroy Terraform-managed infrastructure.
	@terraform destroy -auto-approve

.PHONY: clean
clean: ## Removes .terraform/ folder and all tfstate files.
	@rm -rf .terraform/ terraform.tfstate*

.PHONY: help
help: ## Prints this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
