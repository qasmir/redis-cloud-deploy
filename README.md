# Redis-Cloud-Deploy Deployment Project

This project demonstrates the automated deployment of a Redis service across multiple environments (development, testing, and production) using Terraform and Jenkins.

## Project Structure

```
redis-cloud-deploy
├── README.md
├── jenkins
│   └── Jenkinsfile
└── terraform
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

## Requirements

- **Terraform**: Ensure Terraform is installed on your local machine or CI/CD server.
- **AWS CLI**: Install and configure the AWS CLI with necessary credentials.
- **Jenkins**: Set up Jenkins with the required plugins.
- **Git**: Installed and configured on your local machine.

## Capabilities

- **Automated Deployment**: Deploys Redis service across multiple environments (dev, test, prod) using Terraform.
- **Environment-Specific Configurations**: Supports environment-specific configurations via separate variable files.
- **CI/CD Integration**: Integrates with Jenkins for automated deployment pipelines.
- **Review and Approval**: Includes a review step for manual approval before applying changes to production.

## Setup Instructions

### Terraform Setup

Detailed instructions for the Terraform configuration can be found in the [terraform README](./terraform/README.md).

### Jenkins Setup

Detailed instructions for setting up the Jenkins pipeline, including failure notifications, can be found in the [jenkins README](./jenkins/README.md).

## Conclusion

This project provides a streamlined approach to managing and deploying a Redis service across multiple environments using Terraform and Jenkins. By following the setup instructions, you can ensure a consistent, automated, and reviewed deployment process.

For any questions or issues, please open an issue in the GitHub repository.

Happy deploying with **redis-cloud-deploy**! 🚀