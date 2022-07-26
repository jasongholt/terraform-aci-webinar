//  Cert based authentication is recommended 
provider "aci" {
  username = var.aci_username
  private_key = var.private_key_data
  cert_name = var.private_key_name
  url      = var.aci_url
  insecure = true
  version  = "0.2.1"
}

module "fabric-policies" {
  source  = "app.terraform.io/TerraformACI/fabric-policies/aci"
  version = "0.0.1"
}

module vlan1 {
  source  = "app.terraform.io/TerraformACI/epg-vlan/aci"
  version = "0.0.1"
  tenant_name     = "ACMEA-tenant"
  gateway_address = "10.10.1.1/24"
}

module vlan2 {
  source  = "app.terraform.io/TerraformACI/epg-vlan/aci"
  version = "0.0.1"
  tenant_name     = "ACMEB-tenant"
  gateway_address = "10.10.2.1/24"
  unicast_route   = "yes"
}


module vlan3 {
  source  = "app.terraform.io/TerraformACI/epg-vlan/aci"
  version = "0.0.1"
  tenant_name     = "ACMEC-tenant"
  gateway_address = "10.10.4.1/24"
  unicast_route   = "yes"
}
