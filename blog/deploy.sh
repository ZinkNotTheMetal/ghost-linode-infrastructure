#!/bin/bash

# Add truecharts to helm
helm repo add truecharts https://charts.truecharts.org/

# Install Hexo using the opensource helm chart
helm upgrade --install thesmartestcondo-blog truecharts/hexo-blog \
  --version 2.0.10 \
  --create-namespace \
  --namespace thesmartestcondo-blog

# Helm - location
#  https://github.com/truecharts/charts/blob/master/charts/incubator/hexo-blog/Chart.yaml