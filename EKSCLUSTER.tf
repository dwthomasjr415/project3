resource "aws_eks_cluster" "team1project3-eks" {
  name     = "team1project3-cluster"
  role_arn = aws_iam_role.eks-iam-role.arn

  vpc_config {
    subnet_ids = [var.t1-proj3prisubs1, var.t1-proj3prisubs2]
  }

  depends_on = [
    aws_iam_role.eks-iam-role,
  ]
}
