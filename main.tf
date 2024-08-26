# Providers
provider "aws" {
  region = "us-west-2"  # Choose your region
  profile = "idanuziel"
}

provider "kubernetes" {
  config_path = "~/.kube/config"  # Adjust if needed
}

# VPC and Subnets
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-west-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-3"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.rt.id
}

# IAM Roles and Policies
resource "aws_iam_role" "eks_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_policy" {
  role       = aws_iam_role.eks_role.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role" "node_instance_role" {
  name = "eks-node-instance-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "node_policy" {
  role       = aws_iam_role.node_instance_role.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "ecr_read_only" {
  role       = aws_iam_role.node_instance_role.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "cni_policy" {
  role       = aws_iam_role.node_instance_role.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

# ECR Repository
resource "aws_ecr_repository" "app_repo" {
  name = "my-app"
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app_repo.repository_url
}

# EKS Cluster and Node Group
resource "aws_eks_cluster" "cluster" {
  name     = "my-eks-cluster"
  role_arn  = aws_iam_role.eks_role.arn
  version  = "1.24"

  vpc_config {
    subnet_ids = [
      aws_subnet.subnet1.id,
      aws_subnet.subnet2.id,
      aws_subnet.subnet3.id
    ]
  }
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.node_instance_role.arn
  subnet_ids       = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id,
    aws_subnet.subnet3.id
  ]
  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  instance_types = ["t3.medium"]
}

