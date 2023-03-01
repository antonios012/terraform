provider "azurerm" {
  features {}
}

provider "aws" {
  region = "us-east-1"
}


resource "azurerm_resource_group" "rg" {
  location = "Canada Central"
  name     = rg.name
}


resource "aws_subnet" "this" {
  vpc_id     = aws_vpc.id
  cidr_block = "10.0.1.0/24"
}


