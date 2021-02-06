## Namespace
1. Crear namespace
    ```sh
    kubectl create ns dev
    kubectl create ns qa
    kubectl create ns prd
    ```
1. Recuperar namespace
    ```sh
    kubectl get ns
    ```
1. Crear objetos por namespace
    ```sh
    kubectl create secret generic configserver-key --from-file=./01-config-server/config-server.jks
    kubectl create secret generic configserver-key --namespace dev --from-file=./01-config-server/config-server.jks
    kubectl create secret generic configserver-key --namespace qa --from-file=./01-config-server/config-server.jks
    kubectl create secret generic configserver-key --namespace prd --from-file=./01-config-server/config-server.jks

    kubectl get secrets -n dev
    kubectl get secrets -n qa
    kubectl get secrets -n prd
    ```

1. Convertir [base64](https://www.base64decode.org/) credenciales
    ```bash
    echo -n 'mzegarra@gmail.com' | base64
    echo -n '7HMQ7oCgWaV6gppJ4TRrb3czNvv3Ex' | base64
    echo 'cGFzc3dvcmQ=' | base64 --decode
    ```

1. Crear secret git credentials con namespace
    ```bash
    kubectl apply -f ./01-config-server/1-gitcredentials.yaml

    kubectl apply -n dev -f ./01-config-server/1-gitcredentials.yaml
    kubectl apply -n qa -f ./01-config-server/1-gitcredentials.yaml
    kubectl apply -n prd -f ./01-config-server/1-gitcredentials.yaml

    kubectl apply -f ./01-config-server/1-gitcredentials-ns.yaml
    

    kubectl apply -n dev -f ./01-config-server/2-configserver-settings.yaml
    kubectl apply -n qa -f ./01-config-server/2-configserver-settings.yaml
    kubectl apply -n prd -f ./01-config-server/2-configserver-settings.yaml

    kubectl apply -n dev -f ./01-config-server/3-config-server.yaml
    kubectl apply -n qa -f ./01-config-server/3-config-server.yaml
    kubectl apply -n prd -f ./01-config-server/3-config-server.yaml

    ```

1. Visualizar contextos
    ```bash
    kubectl config view
    kubectl config get-contexts
    kubectl config use-context gke_educalabs_us-east4-c_educadev01
    kubectl config current-context

    kubectl config set-context --current --namespace=dev
    kubectl apply -f ./01-config-server/3-config-server.yaml
    ```


1. Comunicación entre ns
    ```bash
    kubectl config view
    kubectl config get-contexts
    kubectl config use-context gke_educalabs_us-east4-c_educadev01
    kubectl config current-context

    kubectl config set-context --current --namespace=dev
    kubectl apply -f ./01-config-server/3-config-server.yaml
    ```


1. Pod shell
    
    ```bash
    kubectl config set-context --current --namespace=qa
    kubectl run my-shell -i --tty --image ubuntu -- bash
    apt-get update -y
    apt-get install -y curl
    apt-get install -y dnsutils
    apt-get install -y iputils-ping

    nslookup kubernetes.default
    nslookup configserver
    nslookup configserver.dev

    curl http://configserver:8888/clientes/default
    curl http://configserver.dev:8888/clientes/default
    ```
    Use : <service name>
    Use : <service.name>.<namespace name>
    Not : <service.name>.<namespace name>.svc.cluster.local


1. Pod shell
    ```bash
    kubectl get pods --all-namespaces
    kubectl get svc --all-namespaces
    ```    