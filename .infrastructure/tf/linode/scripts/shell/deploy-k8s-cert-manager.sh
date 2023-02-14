#!/bin/bash
VERSION=1.11.0

# Documentation
#  https://cert-manager.io/docs/installation/helm

# Add helm chart
helm repo add jetstack https://charts.jetstack.io

# create cluster issuer.yaml
cat > ./cluster-issuer.yaml << EOF
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    # You must replace this email address with your own.
    # Let's Encrypt will use this to contact you about expiring
    # certificates, and issues related to your account.
    email: williamdzink@gmail.com
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      # Secret resource that will be used to store the account's private key.
      name: lets-encrypt-production-private-key
    # Add a single challenge solver, HTTP01 using nginx
    solvers:
    - http01:
        ingress:
          class: nginx
EOF

# CRD: Custom Resource Definitions
# cert-manager: requires a number of CRD resources, which can be installed manually using kubectl, 
#  or using the installCRDs option when installing the Helm chart.
kubectl apply --namespace cert-manager \
  -f https://github.com/cert-manager/cert-manager/releases/download/v$VERSION/cert-manager.crds.yaml \
  --dry-run=client -o yaml | kubectl apply -f -

# apply cluster issuer 
kubectl apply -f ./cluster-issuer.yaml \
  --namespace cert-manager \
  --dry-run=client -o yaml | kubectl apply -f -

# Install jetstack/cert-manager
helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v$VERSION

# remove config files
rm -rf cluster-issuer.yaml