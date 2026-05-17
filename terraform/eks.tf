resource "aws_eks_cluster" "core" {
  name     = "aurora-eks-x9q7"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private_one.id,
      aws_subnet.private_two.id
    ]
  }

}
