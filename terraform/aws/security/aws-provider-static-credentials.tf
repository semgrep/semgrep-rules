# ruleid: aws-provider-static-credentials
provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAEXAMPLEKEY"
  secret_key = "randomcharactersabcdef"
  profile = "customprofile"
}

# ruleid: aws-provider-static-credentials
provider "aws" {
  region     = "us-west-2"
  secret_key = "randomcharactersabcdef"
  profile = "customprofile"
  access_key = "AKIAEXAMPLEKEY"
}

# ok: aws-provider-static-credentials
provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "/Users/tf_user/.aws/creds"
  profile                 = "customprofile"
}
