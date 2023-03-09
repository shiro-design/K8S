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
```