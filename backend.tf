terraform { 

  backend "s3" { 

    bucket         = "kouadiok-bucket" 

    key            = "terraform-week7/terraform.tfstate" # Optional: Use a unique key path 

    region         = "us-east-1" 

    encrypt        = true 

     

  } 

} 
resource "aws_dynamodb_table" "terraform_state_lock" { 

  name           = "terraform-state-lock" 

  billing_mode   = "PAY_PER_REQUEST"  # You can choose either PROVISIONED or PAY_PER_REQUEST 

  hash_key       = "LockID" 

   

  attribute { 

    name = "LockID" 

    type = "S" 

  } 

 

  ttl {
    attribute_name = "ttl_attribute_terraform-state-lock"
    enabled        = true
  }

 

  tags = { 

    Name = "TerraformStateLock" 

  } 

} 

 output "dynamodb_table_arn" {
  description = "DynamoDB Table ARN"
  value       = aws_dynamodb_table.terraform_state_lock.arn
}

