#!/bin/bash

# Documentation:
# https://www.linode.com/docs/guides/how-to-deploy-nginx-ingress-on-linode-kubernetes-engine/

# Add helm ingress-nginx repo
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

# Install ingress-nginx
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --create-namespace \
  --namespace ingress