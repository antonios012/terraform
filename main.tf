terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.45.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "azurerm_resource_group" "rg1" {
  count    = 3
  name     = "hs-az-rg"
  location = var.resource_group_location

  tags = {
    source = "terraform"
  }
}

locals {
  bucket_settings = {
    "bucket_1"  = { location = "Canada Central" },
    "bucket_2"   = { location = "Canada Central"},
    "bucket_3" = { location = "Canada Central"},
    "bucket_4"    = { location = "Canada Central"}
  }
}

resource "aws_s3_bucket" "b" {
  for_each      = local.bucket_settings

  name               = each.key
  location           = each.value.location
}

variable "resource_group_location" {
  default     = "Canada Central"
  description = "Location of the resource group."
}