
```
kubectl apply -f 01_volume.yaml

kubectl apply -f 02_mysql.yaml

```





```
gcloud compute disks create --size=10GB --zone=us-east4-c my-data-disk

gcloud compute disks create --size=500GB my-data-disk
  --region us-central1
  --replica-zones us-central1-a,us-central1-b


kubectl apply -f 03_web.yaml
kubectl exec -it test-pd -- /bin/sh

cd /usr/share/nginx/html
echo "<html><H1>demo<H1></html>" >> index

```


