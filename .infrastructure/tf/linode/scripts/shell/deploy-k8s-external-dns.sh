#!/bin/bash

# Documentation:
#  https://artifacthub.io/packages/helm/bitnami/external-dns

# Add helm ingress-nginx repo
helm repo add bitnami https://charts.bitnami.com/bitnami

# install external dns controller
# Parameter information: https://artifacthub.io/packages/helm/bitnami/external-dns#external-dns-parameters
helm upgrade --install external-dns bitnami/external-dns \
  --namespace default \
  --set txtOwnerId=wz-linode-pd-k8s \
  --set provider=linode \
  --set policy=upsert-only \
  --set domainFilters="{$(terraform -chdir=.infrastructure/tf/linode/src output -raw tsc_domain)}" \
  --set linode.apiToken="$(terraform -chdir=.infrastructure/tf/linode/src output -raw pat_token)"