# chart-div
Divorce Helm product chart

## Testing

Make sure:
- local kubectl is pointing to sandbox cluster.
` az aks get-credentials --resource-group cnp-aks-sandbox-rg --name cnp-aks-sandbox-cluster --subscription bf308a5c-0624-4334-8ff8-8dca9fd43783 --overwrite`
- sandbox cluster has `divorce` namespace

In root dir:
```
helm init
az acr helm repo add --name hmctspublic --subscription DCD-CNP-PROD   
helm dependency update div 
helm install --wait --timeout 120 --namespace divorce --name div --debug -f div/values.{env}.yaml div
```
