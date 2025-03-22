resource "aws_iam_role" "this" {
  name = "pipeline_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::035330831945:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          },
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:charmingruby/hextech:*"
          }
        }
      }
    ]
  })

  inline_policy {
    name = "pipeline-app-permission"
    policy = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "ECR",
          "Action" : "ecr:*",
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Sid" : "IAM",
          "Action" : "iam:*",
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Sid" : "S3",
          "Action" : "s3:*",
          "Effect" : "Allow",
          "Resource" : "*"
        }
      ]
    })
  }

  tags = merge(
    var.tags,
    {
      Name = "pipeline_role"
    }
  )
}
