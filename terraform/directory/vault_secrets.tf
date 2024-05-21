# # https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/vault_secrets_app
# # Specify the app in the project (one app_name per data block)
# data "hcp_vault_secrets_app" "directory_secrets" {
#   app_name = "UNILORIN-WORKSPACE"
# # Limit the scope to only one or more secrets in the app
#  secrets= {
#     aws_directory_service_directory_directory_passwd = "version 1" 
#  }
# }

# # Replace your existing secret references with
# # data.hcp-vault-secrets_app.aws_app.secret-name
