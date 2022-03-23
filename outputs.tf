####################################################################################
# VPC details

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.info_vpc.id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.info_vpc.arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.info_vpc.cidr_block
}

# Subnet deatils

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.subnetpub2[*].id
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = aws_subnet.subnetpub2[*].arn
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = aws_subnet.subnetpub2[*].cidr_block
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.subnetpub1[*].id
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = aws_subnet.subnetpub1[*].arn
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = aws_subnet.subnetpub1[*].cidr_block
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.main_gw.id
}
####################################################################################
# Security details 

output "ec2_security_group_name" {
  value       = aws_security_group.ec2-sg.name
  description = "The Name of the ec2 security group."
}

output "ec2_security_group_arn" {
  value       = aws_security_group.ec2-sg.arn
  description = "The ARN of the ec2 security group."
}

output "security_group_name" {
  value       = aws_security_group.rds-sg.name
  description = "The name of the RDS MySQL security group."
}
output "security_group_arn" {
  value       = aws_security_group.rds-sg.arn
  description = "The ARN of the RDS MySQL security group."
}

output "private_network_acl_id" {
  description = "ID of the private network ACL"
  value       = aws_network_acl.terra-acl.id
}

output "private_network_acl_arn" {
  description = "ARN of the private network ACL"
  value       = aws_network_acl.terra-acl.arn
}
####################################################################################
# IAM roles & policy details

output "ec2_iam_role_arn" {
  value = aws_iam_role.tf-ec2_role-for-rds-redshift.arn
}

output "redshift_s3_iam_role_arn" {
  value = aws_iam_role.tf-redshift-s3-access-role.arn
}
####################################################################################
# EC2 details

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.terradb.id
}

output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.terradb.public_ip
}
####################################################################################
# S3 details

output "s3_bucket_region" {
  value = aws_s3_bucket.info-bucket.region
}

output "s3-bucket-arn" {
  value = aws_s3_bucket.info-bucket.arn
}


output "s3_bucket_object_uri" {
  value = "s3://${aws_s3_bucket.info-bucket.id}/${aws_s3_object.aws_s3_bucket_text_file_object.key}"
}
####################################################################################
# RDS details

output "rds_end_point" {
  value = aws_db_instance.my-rds-db.endpoint
}
output "rds_address" {
  value = aws_db_instance.my-rds-db.address
}

output "db_instance_allocated_storage" {
  value       = aws_db_instance.my-rds-db.allocated_storage
  description = "The amount of allocated storage."
}

output "db_option_group_id" {
  value       = aws_db_option_group.mydboption.id
  description = "The db option group name."
}

output "db_parameter_group_arn" {
  value       = aws_db_parameter_group.rds-db-paragp.arn
  description = "The ARN of the db parameter group."
}

output "db_subnet_group_arn" {
  value       = aws_db_subnet_group.db_subnet.arn
  description = "The ARN of the rds subnet group."
}

output "db_instance_storage_encrypted" {
  value       = aws_db_instance.my-rds-db.storage_encrypted
  description = "Specifies whether the DB instance is encrypted."
}
####################################################################################
# Redshift details

output "redshift_end_point" {
  value = aws_redshift_cluster.redshift-cluster-info.endpoint
}


###########################################################################################

locals { 

  ec2_details = {
    instance_id =aws_instance.terradb.id
    description = "ID of the EC2 instance"
  }
}


output "ec2-details" {
  value =local.ec2_details
  
}


output "cluster_node_public_ip" {
  value = aws_redshift_cluster.redshift-cluster-info.cluster_nodes[0].public_ip_address
}
####################################################################################
# SES details 
#####################################################################################





