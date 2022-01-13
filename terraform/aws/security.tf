//ruleid: terraform-provider-hardcoded-credentials
provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAEXAMPLEKEY"
  secret_key = "randomcharactersabcdef"
  profile = "customprofile"
}

//ok: terraform-provider-hardcoded-credentials
provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "/Users/tf_user/.aws/creds"
  profile                 = "customprofile"
}
