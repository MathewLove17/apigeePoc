# Policy from local JSON file
resource "aws_iam_policy" "aws_lbc" {
  name   = "${var.cluster_name}-AWSLoadBalancerControllerPolicy"
  policy = file("${path.module}/iam/aws-load-balancer-controller-policy.json")
}

# Trust policy for IRSA (service account in kube-system)
data "aws_iam_policy_document" "aws_lbc_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [module.eks.oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(module.eks.cluster_oidc_issuer_url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:aws-load-balancer-controller"]
    }
  }
}

resource "aws_iam_role" "aws_lbc" {
  name               = "${var.cluster_name}-aws-lbc"
  assume_role_policy = data.aws_iam_policy_document.aws_lbc_assume_role.json
}

resource "aws_iam_role_policy_attachment" "aws_lbc_attach" {
  role       = aws_iam_role.aws_lbc.name
  policy_arn = aws_iam_policy.aws_lbc.arn
}

output "aws_lbc_role_arn" {
  value = aws_iam_role.aws_lbc.arn
}
