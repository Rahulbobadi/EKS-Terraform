resource "aws_eks_cluster" "demo" {
  name     = "demo"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.28"

  vpc_config {
    subnet_ids = [
        aws_subnet.public_a.id,
        aws_subnet.public_b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.cluster_policy]
}