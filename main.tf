module "aws_lambda" {
  source = "./modules/lambda"

  function_name = "hello-lambda"
}

module "azure_function" {
  source   = "./modules/azure-function"
  location = var.azure_location
}
