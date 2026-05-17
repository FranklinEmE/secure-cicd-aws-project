resource "aws_eks_node_group" "workers" {
  cluster_name    = aws_eks_cluster.core.name
  node_group_name = "workers"
  node_role_arn   = aws_iam_role.node_role.arn

  subnet_ids = [
    aws_subnet.public_one.id,
    aws_subnet.public_two.id
  ]

  instance_types = ["t3.micro"]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }
}
