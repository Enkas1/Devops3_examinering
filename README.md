#  CI/CD with Docker, Kubernetes and Ansible

This repository builds an Nginx image that serves index.html. When a tag is pushed, the ``docker-image-build-pipeline.yaml`` pipeline is triggered. It builds the Docker image, tags it, runs tests to check the container status, performs a curl request to check if the Nginx website is accessible, and finally pushes the versioned image to GitHub Container Registry.

Using Minikube you'll set up a cluster with ``nginx-deployment.yaml`` and ``nginx-svc.yaml``. To update the cluster with a newer version you can run the ``deploy-playbook.yaml``.

## Prerequisites
Before running the application, ensure you have the following installed:

- Minikube
- Ansible
- Docker

## Step-by-Step Guide

### 1. Start Minikube
Start a Minikube cluster if it is not already running:
```sh
minikube start
```

### 2. Deploy the Application
Run the following commands to apply the deployment and service:
```sh
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-svc.yaml
```

### 3. Verify the Application Status
Check if the pods are running:
```sh
kubectl get pods
```

Check if the service is up:
```sh
kubectl get svc
```

### 4. Access the Application
Access website with the following command:
```sh
minikube service frontend-service
```
### 5. Updating the Version
To update the website and roll out the changes to the cluster:

1. Make a change to the index.html file.
2. Commit and push the changes.
3. Tag the commit with a version number (the tag must start with v, e.g., v1.0.0).
4. Push the tag to trigger the pipeline.

Once the pipeline completes, the newly built image will be available here:
https://github.com/Enkas1/devops3_examinering/pkgs/container/devops3_examinering

### 6. Running the Ansible Playbook
To deploy the newly pushed version, run the following command, replacing "v2.0.0" with your version:

```sh
ansible-playbook deploy-playbook.yaml -e new_version="v2.0.0"
```
### 7. Access the Application again or inspect Minikube Dashboard
```sh
minikube service frontend-service
```
```sh
minikube dashboard
```
