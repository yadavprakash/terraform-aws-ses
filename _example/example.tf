provider "aws" {
  region = "us-west-2"
}
locals {
  name        = "ses"
  environment = "sandbox"
}

# An SES can either be created as a Domain identity type or Email address identity type
# To enable Email address identity type, pass the email addresses in emails attribute. eg emails = ["test@example.com","help@example.com"]
# To enable Domain identity type, let emails be empty and set domain . eg domain = "test.example.com"

module "ses" {
  source = "./../"

  name         = local.name
  environment  = local.environment
  domain       = "example.ca"
  enable_email = true
  emails       = []
  zone_id      = "XXXXXXXX7289RP"

  enable_mx         = true
  enable_spf_domain = true
}
