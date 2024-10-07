# Coworking Space Analytics Service

The Coworking Space Analytics Service provides APIs for business analysts to access user activity analytics within a coworking space platform. It utilizes a microservices architecture to ensure scalability and independent deployment.

## Technologies and Tools

- **Python & Flask**: Backend application framework.
- **PostgreSQL**: Database for storing analytics data.
- **Docker**: Containerizes the application for consistent environments.
- **Amazon ECR**: Hosts Docker images.
- **AWS CodeBuild**: Automates build and push processes.
- **Kubernetes (AWS EKS)**: Orchestrates container deployments.
- **ConfigMaps and Secrets**: Manage configuration and sensitive data in Kubernetes.
- **Amazon CloudWatch**: Provides container insights and monitoring for the cluster.

## Deployment Process

The deployment pipeline is automatically triggered when a pull request is merged into the main branch. AWS CodeBuild handles continuous integration by building the Docker image defined in the `Dockerfile`, tagging it, and pushing it to Amazon ECR using the `buildspec.yml`. This ensures each build is consistent and reproducible.

## Releasing New Builds

To deploy changes:
1. **Push Code Changes**: Commit and push updates to the GitHub repository and merge them via a pull request.
2. **Automated Build**: CodeBuild detects the merge, builds a new Docker image, tags it, and pushes it to ECR.
3. **Update Deployment**: Update the `image` field in `deployment/coworking.yaml` with the new image URI.
4. **Apply Changes**: Run `kubectl apply -f deployment/coworking.yaml` to update the Kubernetes cluster.

## Project Structure

- **deployment/**: Contains Kubernetes manifests (`configmap.yaml`, `coworking.yaml`, `secret.yaml`).
- **analytics/**: Holds the application code (`app.py`, `config.py`, `requirements.txt`).
- **db/**: Includes SQL scripts for database setup and seeding (`1_create_tables.sql`, `2_seed_users.sql`, `3_seed_tokens.sql`).
- **buildspec.yml**: Defines the build process for CodeBuild.
- **Dockerfile**: Specifies the Docker image configuration.

## Monitoring and Insights

Amazon CloudWatch is integrated to provide container insights, offering visibility into the performance and health of the Kubernetes cluster. This allows for proactive monitoring and quick identification of issues.

