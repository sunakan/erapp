resource "aws_iam_policy" "deploy" {
  name = "ecr-deploy"
  path = "/"
  description = "deploy to ecr"
  policy = file("iam/policies/ecr_push.json")
}
