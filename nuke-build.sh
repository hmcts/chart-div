#!/bin/bash

az acr helm repo add --name hmctspublic --subscription DCD-CNP-PROD
az aks get-credentials --resource-group cnp-aks-rg --name cnp-aks-cluster --subscription DCD-CNP-DEV --overwrite

helm delete --purge patryk-div
kubectl  delete --all jobs -n chart-tests
rm -fr div/charts/*

helm dependency update div/
helm upgrade --install patryk-div div/ --namespace=chart-tests -f div/values.yaml -f div/values.demo.yaml --timeout=900
