resource "aws_iam_policy" "deploy_policy" {
  name        = "ecr-deploy"
  path        = "/"
  description = "deploy to ecr"
  policy      = file("iam/policies/ecr_push.json")
}

resource "aws_iam_group" "deploy_group" {
  name = "deploy-ecr"
}

resource "aws_iam_group_policy_attachment" "attach_deploy" {
  group      = aws_iam_group.deploy_group.name
  policy_arn = aws_iam_policy.deploy_policy.arn
}

resource "aws_iam_user" "deploy_user" {
  name = "deploy-user"
}

resource "aws_iam_group_membership" "deploy_membership" {
  name  = "deploy-membership"
  users = [aws_iam_user.deploy_user.name]
  group = aws_iam_group.deploy_group.name
}