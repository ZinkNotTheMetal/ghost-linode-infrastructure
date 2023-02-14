#!/bin/bash

echo $1 | base64 --decode > ~/.kube/linode_config

LINODE_CLUSTER=$(cat ~/.kube/linode_config | awk '/current-context:/ {print $2}')

cat ~/.kube/linode_config > ~/.kube/config;

kubectl config use-context $LINODE_CLUSTER