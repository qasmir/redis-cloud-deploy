# Terraform Configuration for Redis-Cloud-Deploy

This directory contains the Terraform configuration files for deploying a Redis service across multiple environments (development, testing, and production).

## Directory Structure

```
terraform
├── main.tf
├── backend.tf
├── modules
│   └── redis
│       ├── main.tf
│       └── variables.tf
└── vars
    ├── dev
    │   ├── dev.tfvars
    │   └── variables.tf
    ├── prod
    │   ├── prod.tfvars
    │   └── variables.tf
    └── test
        ├── test.tfvars
        └── variables.tf
```

## Files and Folders

- **main.tf**: This file defines the main Terraform configuration for deploying the Redis service. It includes the provider configuration, module calls, and output definitions.

- **modules/redis**:
  - **main.tf**: This file contains the resource definitions for the Redis module, including the AWS ElastiCache cluster configuration.
  - **variables.tf**: This file defines the input variables required by the Redis module.

- **backend.tf**: This file configures the remote backend for storing the Terraform state files. It specifies the S3 bucket and DynamoDB table used for state management and locking.

- **vars**:
  - **dev**:
    - **dev.tfvars**: This file contains the variable values specific to the development environment.
    - **variables.tf**: This file defines the input variables for the development environment.
  - **prod**:
    - **prod.tfvars**: This file contains the variable values specific to the production environment.
    - **variables.tf**: This file defines the input variables for the production environment.
  - **test**:
    - **test.tfvars**: This file contains the variable values specific to the testing environment.
    - **variables.tf**: This file defines the input variables for the testing environment.

## Usage

1. **Initialize Terraform**:
   ```sh
   terraform init
   ```

2. **Select or Create a Workspace**:
   ```sh
   terraform workspace new dev
   terraform workspace new test
   terraform workspace new prod
   ```

3. **Apply Configuration for a Specific Environment**:
   - **Development**:
     ```sh
     terraform workspace select dev
     terraform apply -var-file=vars/dev/dev.tfvars -auto-approve
     ```
   - **Testing**:
     ```sh
     terraform workspace select test
     terraform apply -var-file=vars/test/test.tfvars -auto-approve
     ```
   - **Production**:
     ```sh
     terraform workspace select prod
     terraform apply -var-file=vars/prod/prod.tfvars -auto-approve
     ```

This setup ensures a consistent and organized deployment process across different environments.