# How to use AWS CLI or any Custom Command using Terraform

## Introduction
This is a simple example of how to use AWS CLI or any custom command using Terraform.

A better story, with explanations could be found in this [Medium story](https://medium.com/@raeveenpasupathy/how-to-use-aws-cli-or-any-custom-command-using-terraform-raeveen-pasupathy-503e730e52b6).

## Prerequisites
- Terraform
- AWS CLI

## Usage
1. Clone this repository
2. Run `terraform init`
3. Check the `_variables.tf` and `main.tf` file.
4. Run `terraform apply --auto-approve`

## Teardown
1. Run `terraform destroy --auto-approve`
2. You are all good. The resources are destroyed.