#!/bin/bash

echo $1 | base64 --decode > ~/.kube/linode_config

export KUBECONFIG=~/.kube/config:~/.kube/linode_config

kubectl config get-contexts