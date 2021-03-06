# Monitoreo

============

1. Convertir [base64](https://www.base64decode.org/) credenciales
    ```bash
    echo -n 'mzegarra@gmail.com' | base64
    echo -n '.HTRNNBYqw!Eyi!hkYr_4TJCWM4439' | base64
    echo 'cGFzc3dvcmQ=' | base64 --decode
    ```

1. Crear secret git credentials con namespace
    ```bash
    kubectl create secret generic configserver-key --from-file=./01-config-server/config-server.jks
    kubectl apply -f ./01-config-server/1-gitcredentials.yaml    
    kubectl apply -f ./01-config-server/2-configserver-settings.yaml
    kubectl apply -f ./01-config-server/3-config-server.yaml
    ```

## 5. Crear base de datos con volume

1. Crear volume
    ```bash
    kubectl apply -f ./02-db/1-volume.yaml
    ```

1. Crear credentials
    ```bash
    kubectl apply -f ./02-db/2-secrets.yaml
    ```
1. Crear deployment + service
    ```bash
    kubectl apply -f ./02-db/3-db.yaml
    ```


## 6. Crear cache service

1. Crear credentials
    ```bash
    kubectl apply -f ./03-cache/1-secrets.yaml
    ```

1. Crear deployment + service
    ```bash
    kubectl apply -f ./03-cache/2-cache.yaml
    ```

## 7. Crear bus service

1. Crear bus service
    ```bash
    kubectl apply -f ./04-bus/bus.yaml
    ```
## 8. Creando configuración común
1. Crear bus service
    ```bash
    kubectl apply -f ./01-config-server/4-ms-configurations.yaml
    ```

## 9. Desplegar microservices
1. Crear customers
    ```bash
    kubectl apply -f ./05-microservices/lab01.yaml
    ```

1. Crear application
    ```bash
    kubectl apply -f ./05-microservices/lab02.yaml
    ```

1. Crear security
    ```bash
    kubectl apply -f ./05-microservices/lab05.yaml
    ```

## Prometheus
```bash
kubectl apply -f ns.yml

kubectl apply -f ./k8s-prometheus/1_clusterRole.yaml -n monitoring
kubectl apply -f ./k8s-prometheus/2_config-map.yaml -n monitoring
kubectl apply -f ./k8s-prometheus/3_prometheus-deployment.yaml -n monitoring
kubectl apply -f ./k8s-prometheus/4_create-service.yml -n monitoring

kubectl port-forward -n monitoring service/prometheus-service 9090

```  



## Grafana

```bash

kubectl apply -f ./k8s-prometheus/5_grafana-svc.yaml -n monitoring
kubectl apply -f ./k8s-prometheus/6_daemonset.yml -n monitoring
kubectl apply -f ./k8s-prometheus/7_state-metrics-deploy.yaml -n monitoring
kubectl apply -f ./k8s-prometheus/8_state-metrics-rbac.yaml -n monitoring
kubectl port-forward -n monitoring service/grafana-service 3000

```  


## Dashboard

 https://grafana.com/grafana/dashboards/13105
 https://grafana.com/grafana/dashboards/13770
 https://grafana.com/grafana/dashboards/10939
 https://grafana.com/grafana/dashboards/10858
 https://grafana.com/grafana/dashboards/11663
 https://grafana.com/grafana/dashboards/11802
 https://grafana.com/grafana/dashboards/8588
 https://grafana.com/grafana/dashboards/10300
 https://grafana.com/grafana/dashboards/8670


 