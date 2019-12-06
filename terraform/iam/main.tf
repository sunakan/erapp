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
