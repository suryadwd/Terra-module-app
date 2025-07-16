module "dev-infra" {
  source = "./module"
  env = "dev"
  bucket_name = "suraj-infra-bucket"
  sg_name = "suraj"
  instance_count = 1
  instance_type = "t2.micro"
  ami = "ami-014e30c8a36252ae5"
  db_name = "suarj"
  hash_key = "mereId"

}