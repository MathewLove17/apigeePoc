terraform {
  backend "gcs" {
    bucket      = "tfstate-pocapigee-485810"
    prefix      = "apigee/bootstrap"
    credentials = "/tf/ecf7f2e7-21d2-4254-aaff-c517c8818a21/gcp-creds.json"
  }
}
