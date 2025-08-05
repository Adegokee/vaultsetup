# listener "tcp" {
#   address     = "0.0.0.0:8200"
#   tls_disable = 1
# }

# storage "postgresql" {
#   connection_url = "postgresql://vault:vaultpass@vault-postgres:5432/vaultdb?sslmode=disable"
#   table          = "vault_kv_store"
#   ha_enabled     = "false"
# }

# disable_mlock = true
# ui = true
