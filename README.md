# Pac-Man Game on AWS

![pacman pic](https://github.com/user-attachments/assets/1c1d683b-ea36-4873-b787-e56914a5cfb3)

## Overview

**Pac-Man Game** is a classic arcade game deployed on AWS. This project showcases a complete deployment pipeline using modern DevOps practices. It includes provisioning infrastructure with Terraform, creating an EKS cluster, setting up CI/CD pipelines, and deploying a MongoDB StatefulSet.

**Features:**
- Deployed on AWS using Terraform and EKS.
- Exposed via an AWS Load Balancer.
- CI/CD pipeline for automated builds and deployments.
- MongoDB database using StatefulSets and Persistent Volumes.
- Optional Grafana/Prometheus dashboard for cluster monitoring.

## Source Code

The source code for the Pac-Man game can be found here: [Pac-Man GitHub Repository](https://github.com/font/pacman).

## Requirements

### Infrastructure Setup

1. **Terraform**: Ensure you have Terraform installed to provision infrastructure.
2. **AWS CLI**: Configure your AWS CLI with appropriate credentials.
3. **kubectl**: Install kubectl to interact with the EKS cluster.

### Deployment Steps

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
    - Follow the Terraform scripts to set up an EKS cluster with two `t3.medium` worker nodes.

4. **Expose the Application:**
    - Configure the service to use an AWS Load Balancer. Ensure your service configuration file includes the necessary load balancer annotations.

5. **Set Up CI/CD Pipeline:**
    - Implement a CI/CD pipeline using AWS CodePipeline or another CI/CD tool to automatically build and deploy EKS workloads.

6. **Deploy MongoDB:**
    - Use Kubernetes StatefulSets and Persistent Volumes to deploy MongoDB. Ensure your MongoDB configuration aligns with best practices for high availability and data persistence.

7. **Optional - Monitoring Setup:**
    - Install Grafana and Prometheus on your EKS cluster.
    - Configure Prometheus to scrape metrics from your Kubernetes nodes and pods.
    - Create Grafana dashboards to visualize CPU, Memory, and Storage utilization.

## Usage

1. Access the Pac-Man game via the AWS Load Balancer URL.
2. Use the arrow keys to navigate Pac-Man through the maze.
3. Collect all pellets and avoid the ghosts to achieve the highest score.

## Screenshots

![Screenshot 1](https://via.placeholder.com/600x400?text=Screenshot+1)
![Screenshot 2](https://via.placeholder.com/600x400?text=Screenshot+2)

## Contributing

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
5. **Open a pull request.**

For detailed instructions, see [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

## Acknowledgements

- Thanks to [Contributor Name] for [specific contribution].
- Special thanks to the [Grafana/Prometheus] community for their excellent monitoring tools.

## Contact

For any questions or issues, please reach out to:

- **Name**: Your Name
- **Email**: your.email@example.com
- **GitHub**: [@yourusername](https://github.com/yourusername)

---

**Pac-Man Game on AWS** © [Year] by [Your Name]. Built with ❤️ for classic arcade fans.
