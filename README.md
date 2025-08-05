# Vault Setup Guide

## 1. Unseal Vault and Login (First Time Setup)

### Initialize Vault

```sh
docker exec -it vault vault operator init
```

> Save the Unseal Keys and Initial Root Token shown.

### Unseal Vault (use 3 of the keys)

```sh
docker exec -it vault vault operator unseal
```

### Login to Vault

```sh
docker exec -it vault vault login
```

## 2. Enable Userpass Authentication

```sh
docker exec -it vault vault auth enable userpass
```

## 3. Create a User with Policy

```sh
docker exec -it vault vault write auth/userpass/users/myuser password=mypassword policies=my-policy
```

## 4. Create a Policy File

```sh
docker exec -it vault sh -c 'echo "
path \"secret/data/*\" {
  capabilities = [\"create\", \"read\", \"update\", \"delete\", \"list\"]
}
" > /vault/config/my-policy.hcl'
```

## 5. Write the Policy to Vault

```sh
docker exec -it vault vault policy write my-policy /vault/config/my-policy.hcl
```

## 6. Enable the KV Secrets Engine

Enable it under path `secret/`:

```sh
docker exec -it vault vault secrets enable -path=secret kv-v2
```

## 7. Add a Secret

```sh
docker exec -it vault vault kv put secret/myapp username="naski" password="supersecret123"
```

## 8. Test Login with Userpass (Optional)

You can test it using:

```sh
docker exec -it vault vault login -method=userpass username=myuser password=mypassword
```
