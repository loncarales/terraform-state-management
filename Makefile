all: help

.PHONY: init
init: ## Initialize a new or existing OpenTofu working directory by creating initial files, loading any remote state, downloading modules, etc.
	@tofu init

.PHONY: validate
validate: ## Validate the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc.
	@tofu validate

.PHONY: plan
plan: ## Generates a speculative execution plan, showing what actions OpenTofu would take to apply the current configuration. This command will not actually perform the planned actions.
	@tofu plan

.PHONY: apply
apply: ## Creates or updates infrastructure according to OpenTofu configuration files in the current directory.
	@tofu apply -auto-approve

.PHONY: destroy
destroy: ## Destroy OpenTofu-managed infrastructure.
	@tofu destroy -auto-approve

.PHONY: clean
clean: ## Removes .terraform/ folder and all tfstate files.
	@rm -rf .terraform/ terraform.tfstate*

.PHONY: help
help: ## Prints this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
