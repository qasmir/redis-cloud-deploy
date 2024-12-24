# Jenkins Pipeline for Redis-Cloud-Deploy

This directory contains the Jenkins pipeline configuration file (`Jenkinsfile`) for automating the deployment of the Redis service across multiple environments (development, testing, and production) using Terraform.

## File Structure

```
jenkins
└── Jenkinsfile
```

## Jenkins Pipeline Overview

The `Jenkinsfile` defines the CI/CD pipeline for deploying the Redis service using Terraform. It includes stages for checking out the code, formatting Terraform files, validating the configuration, initializing Terraform, planning the deployment, and applying the configuration. The pipeline also includes a manual review and approval step before applying changes to production and failure notifications.

## Pipeline Stages

1. **Checkout**: Checks out the code from the Git repository and sets the `STAGE` environment variable based on the current Git branch.
2. **Terraform Fmt**: Ensures the Terraform files are properly formatted.
3. **Terraform Validate**: Validates the Terraform configuration files for syntax errors and ensures the configuration is valid.
4. **Terraform Init**: Initializes Terraform for the specified environment and selects or creates the appropriate workspace.
5. **Terraform Plan**: Plans the Terraform deployment for the specified environment using the environment-specific variable file.
6. **Review and Approval**: Pauses the pipeline and waits for user confirmation before proceeding to the apply stage.
7. **Terraform Apply**: Applies the Terraform configuration for the specified environment using the environment-specific variable file.

## Failure Notifications

The Jenkins pipeline includes email notifications for build failures, successes, and instabilities. The `post` block in the `Jenkinsfile` is used to define these notifications:

- **always**: Sends a notification email after every build.
- **success**: Sends a notification email if the build is successful.
- **failure**: Sends a notification email if the build fails.
- **unstable**: Sends a notification email if the build is unstable.

For detailed information about the Jenkins pipeline configuration, please refer to the [Jenkinsfile](./Jenkinsfile).

## Setup Instructions

1. **Install Jenkins**: Follow the official Jenkins installation guide for your platform.
2. **Install Required Plugins**:
   - **Git Plugin**
   - **AWS Credentials Plugin**
   - **Terraform Plugin**
   - **Mailer Plugin**

3. **Add AWS Credentials**:
   - Go to Jenkins Dashboard > Manage Jenkins > Manage Credentials.
   - Add your AWS `Access Key ID` and `Secret Access Key`.

4. **Configure Email Notifications**:
   - Go to **Manage Jenkins > Configure System**.
   - In the **Extended E-mail Notification** section, configure your SMTP server and email settings.

5. **Create a New Pipeline Job**:
   - Go to Jenkins Dashboard > New Item > Pipeline.
   - Name your pipeline (e.g., `redis-cloud-deploy-deployment`).

6. **Configure the Pipeline**:
   - In the pipeline configuration, select "Pipeline script from SCM".
   - Set "SCM" to "Git" and provide the repository URL: `https://github.com/your-username/redis-cloud-deploy.git`.
   - Ensure the branch is set to the one you want to monitor (e.g., `*/dev`, `*/test`, `*/prod`).

7. **Run the Pipeline**:
   - Trigger the pipeline job manually or set up webhooks to automatically trigger it on code changes.

## Conclusion

The Jenkins pipeline defined in the `Jenkinsfile` automates the deployment of the Redis service using Terraform across multiple environments. It includes validation, formatting, and failure notification steps to ensure a consistent and reliable deployment process. By following the setup instructions, you can ensure a consistent and automated deployment process with manual review and approval for production changes.