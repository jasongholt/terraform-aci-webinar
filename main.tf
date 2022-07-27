//  Cert based authentication is recommended 
terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = "2.2.0"
    }
  }
}


provider "aci" {
  username = var.apic_user
  password = var.apic_password
  url      = var.apic_url
  insecure = true
}

module "fabric-policies" {
  source = "app.terraform.io/jasongholt-demos/fabric-policies/aci"
  # source  = "../terraform-aci-fabric-policies/"
  version = ">=0.0.1"
}

module "vlan1" {
  source = "app.terraform.io/jasongholt-demos/epg-vlan/aci"
  # source  = "../terraform-aci-epg-vlan/"
  version         = ">=0.0.1"
  tenant_name     = "ACMEA-tenant"
  gateway_address = "10.10.1.1/24"
}

module "vlan2" {
  source = "app.terraform.io/jasongholt-demos/epg-vlan/aci"
  #source  = "../terraform-aci-epg-vlan/"
  version         = ">=0.0.1"
  tenant_name     = "ACMEB-tenant"
  gateway_address = "10.10.2.1/24"
  unicast_route   = "yes"
}

  module "vlan3" {
  source = "app.terraform.io/jasongholt-demos/epg-vlan/aci"
  #source  = "../terraform-aci-epg-vlan/"
  version         = ">=0.0.1"
  tenant_name     = "demo-tenant"
  gateway_address = "10.10.2.1/24"
  unicast_route   = "yes"
}
