#!/bin/bash
sed "s/VersionTags/$1/g" Kubernetes/minikube/product_deployment.yaml > Kubernetes/minikube/product_app_deployment.yaml