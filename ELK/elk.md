# Install Helm on Windows

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

# Add Elastic Repo:
```
choco install kubernetes-helm
```
# Install ELK Stack
```
helm install elasticsearch elastic/elasticsearch -f value.yaml --namespace=elk --create-namespace --wait
kubectl port-forward service/elasticsearch-master 9200 --namespace=elk
```
# Install Kibana
```
helm install kibana elastic/kibana --namespace=elk --wait
kubectl port-forward deployment/kibana-kibana 5601 --namespace=elk
```
# Install Filebeat
```
helm install filebeat elastic/filebeat --namespace=elk --wait
```

# Verify ELK Stack
```
* Create an Index
Management --> kibana --> indexPatterms
* Search Index
Analytics --> Discover
```