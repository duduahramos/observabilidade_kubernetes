# Remover o Minikube existente
Write-Output "Deletando o Minikube existente..."
minikube delete

# Iniciar o Minikube
Write-Output "Iniciando o Minikube..."
minikube start

# Aplicar namespace de telemetria
Write-Output "Aplicando namespace de telemetria..."
kubectl apply -f D:\agger\observability_kubernetes_terraform\namespace\telemetry.yaml

# Aplicar volume para Loki - Persistent Volume
Write-Output "Aplicando volume para Loki - Persistent Volume..."
kubectl apply -f D:\agger\observability_kubernetes_terraform\volume\loki-pv.yaml

# Aplicar volume para Loki - Persistent Volume Claim
Write-Output "Aplicando volume para Loki - Persistent Volume Claim..."
kubectl apply -f D:\agger\observability_kubernetes_terraform\volume\loki-pvc.yaml

# Implantar Promtail
Write-Output "Implantando Promtail..."
kubectl apply -f D:\agger\observability_kubernetes_terraform\deployment\promtail.yaml

# Implantar Loki
Write-Output "Implantando Loki..."
kubectl apply -f D:\agger\observability_kubernetes_terraform\deployment\loki.yaml

# Implantar Jaeger
Write-Output "Implantando Jaeger..."
kubectl apply -f D:\agger\observability_kubernetes_terraform\deployment\jaeger.yaml

# Implantar Prometheus
Write-Output "Implantando Prometheus..."
kubectl apply -f D:\agger\observability_kubernetes_terraform\deployment\prometheus.yaml

# Implantar OpenTelemetry Collector
Write-Output "Implantando OpenTelemetry Collector..."
kubectl apply -f D:\agger\observability_kubernetes_terraform\deployment\otel-collector.yaml

# Implantar Grafana
Write-Output "Implantando Grafana..."
kubectl apply -f D:\agger\observability_kubernetes_terraform\deployment\grafana.yaml

Write-Output "Todos os recursos foram aplicados com sucesso!"
kubectl get all -n telemetry
