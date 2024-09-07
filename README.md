# Idan Uziel Project - Pac-Man Game ☁️

![pacman pic](https://github.com/user-attachments/assets/1c1d683b-ea36-4873-b787-e56914a5cfb3)

🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡🟡
## Overview🔎

**Pac-Man Game** is a classic arcade game deployed on AWS. This project showcases a complete deployment pipeline using modern DevOps practices. It includes provisioning infrastructure with Terraform, creating an EKS cluster, setting up CI/CD pipelines, and deploying a MongoDB StatefulSet.

**Features🧩:**
- Deployed on AWS using Terraform and EKS.
- Exposed via an AWS Load Balancer.
- CI/CD pipeline for automated builds and deployments.
- MongoDB database using StatefulSets and Persistent Volumes.
- Grafana/Prometheus dashboard for cluster monitoring.
  
## 


![diagram project](https://github.com/user-attachments/assets/ba904be0-6423-4f42-878d-d0dcebd14ece)


 

## Source Code</>

The source code for the Pac-Man game can be found here: [Pac-Man GitHub Repository](https://github.com/font/pacman.git).

## Requirements

### Infrastructure Setup

1. **Terraform**: Ensure you have Terraform installed to provision infrastructure.
2. **AWS CLI**: Configure your AWS CLI with appropriate credentials.
3. **kubectl**: Install kubectl to interact with the EKS cluster.

### Deployment Steps📋

1. **Clone the Repository:**
    ```bash
    git clone https://github.com/font/pacman.git
    cd pacman
    ```

2. **Provision Infrastructure with Terraform:**
    - Navigate to the Terraform directory.
    - Initialize Terraform:
      ```bash
      terraform init
      ```
    - Apply Terraform configurations:
      ```bash
      terraform apply
      ```

3. **Create an EKS Cluster:**
    - Followed the Terraform scripts to set up an EKS cluster with two `t3.medium` worker nodes.

4. **Expose the Application:**
    - Configured the service to use an AWS Load Balancer. Ensured the service configuration file includes the necessary load balancer annotations.

5. **Set Up CI/CD Pipeline:**
    - Implemented a CI/CD pipeline using AWS CodePipeline - Codebuild to automatically build and deploy EKS workloads.

6. **Deploy MongoDB:**
    - Used Kubernetes StatefulSets and Persistent Volumes to deploy MongoDB. Ensured MongoDB configuration aligns with best practices for high availability and data persistence.

7. **Monitoring Setup:**
    - Installed Grafana and Prometheus on your EKS cluster.
    - Configured Prometheus to scrape metrics from your Kubernetes nodes and pods.
    - Created Grafana dashboards to visualize CPU, Memory, and Storage utilization.

## Usage📝

1. Access the Pac-Man game via the AWS Load Balancer URL.
2. Use the arrow keys to navigate Pac-Man through the maze.
3. Collect all pellets and avoid the ghosts to achieve the highest score.

## Screenshots📸
<img src="https://github.com/user-attachments/assets/ca089712-8e03-4a7e-a6e6-1b3c41d94eb5">


## Dashboard for Kubernetes Cluster Monitoring Using Grafana/Prometheus📊
I used Grafana to create dashboards that displays the overall cluster utilization in terms of CPU, Memory, Storage usage and more. it was collected by Prometheus in a visual, clear and detailed way from localhost access.
![BeFunky-collage (2)](https://github.com/user-attachments/assets/c118d106-719b-4f1f-978b-d144825b5a44)



## Contributing✍

We welcome contributions to improve the Pac-Man game or deployment setup. To contribute:

1. **Fork the repository.**
2. **Create a new branch:**
    ```bash
    git checkout -b feature/YourFeature
    ```
3. **Make your changes and commit:**
    ```bash
    git commit -am 'Add new feature'
    ```
4. **Push to the branch:**
    ```bash
    git push origin feature/YourFeature
    ```

## License🧾

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

## Contact💬


- **Name**: Idan Uziel
- **Email**: idanu55@gmail.com

---

**Pac-Man Game - AWS Project☁️** © 2024 by Idan Uziel. Built with ❤️ for classic arcade fans.
