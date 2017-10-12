# Getting started with Terraform

I have been mucking around with Terraform so that I can learn how it works!

## Usage

### Secrets

To be able to authenticate with AWS, put an access/secret key pair into `secrets.auto.tfvars` like so:

```terraform
access_key = "Access key ID"

secret_key = "Secret access key"
```

Initialise Terraform, to download the appropriate provider binary, etc:

```bash
terraform init
```

Have Terraform plan its deployment:

```bash
terraform plan
```

Deploy resources:

```bash
terraform apply
```
