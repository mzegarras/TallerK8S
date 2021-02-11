1.-

kubectl create namespace monitoring

2.- Create the role
kubectl apply -f 1_clusterRole.yaml

3.-

kubectl apply -f 2_config-map.yaml -n monitoring


kubectl apply -f 3_prometheus-deployment-map.yaml -n monitoring

kubectl apply -f 4_create-service.yml -n monitoring


kubectl port-forward -n monitoring prometheus-deployment-7c878596ff-sdp78 9090
kubectl port-forward -n monitoring service/prometheus-service 8081


4.-

5_prometheus-svc.yaml
