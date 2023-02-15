# Personal Linode setup

## Goals

1. To get familiar with the least expensive cloud provider [Linode](https://linode.com)
2. To start hosting a blog with my custom domain
3. Setup Kubernetes instance with public cloud for test development and understanding of K8S

## Getting started

### Prerequisites

- Setup an account with [Linode](https://linode.com)
- Understanding of Terraform
- Purchasing a domain through a Domain Registrar (i.e. - GoDaddy)

### Ansible

```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub LOGIN_DESIRED_USER_NAME@IP_ADDRESS_OF_THE_SERVER
```

```bash
ansible-playbook -K -i production --vault-password-file ~/.ansible/password site.yml
```

## Blogging platform