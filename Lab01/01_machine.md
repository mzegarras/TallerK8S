# Kubernetes

* [Zoom] ()
* [Syllabus](https://raw.githubusercontent.com/mzegarras/Galaxy-DockerK8S-202009/master/Lab01/Syllabus.pdf)

### Tools

1. [Filezilla](https://filezilla-project.org/) - Transferir archivos
1. [Putty](https://www.putty.org/) - Putty
1. [Docker](https://www.docker.com/) - Docker / Docker-compose
1. [Kubernetes](https://kubernetes.io/docs/reference/using-api/client-libraries/#officially-supported-kubernetes-client-libraries) - Kubernetes


### Issues network
1. To disabled wifi

    ```console
    networksetup -setv6off Wi-Fi
    networksetup -setv6automatic Wi-Fi
    ```

### Google cloud
1. Configurar cuenta gcloud
    ```console
    gcloud auth login
    ```
1. Listar regiones y zones
    ```console
    gcloud compute regions list
    gcloud compute zones list
    gcloud compute zones list --filter="region:( us-central1 )"
    ```

1. Config project

    ```console
    gcloud projects list
    gcloud projects create educalabs
    gcloud config set project educalabs
    ```
1. To enable billing

1. Default region and zones
    ```console
    gcloud compute project-info describe --project educalabs
    ```
    * Finds keys:  
        * google-compute-default-region
        * google-compute-default-zone

    ```console
    gcloud compute project-info add-metadata \
    --metadata google-compute-default-region=us-east4,google-compute-default-zone=us-east4-c
    ```

1. Google's regions and zones

    ```console
    gcloud compute regions list
    gcloud compute zones list
    gcloud compute zones list --filter="region:( us-central1 )"
    ```

1. Default region and zones
    ```console
    gcloud compute project-info describe --project devops202101
    ```
    * Finds keys:  
        * google-compute-default-region
        * google-compute-default-zone

    ```console
    gcloud compute project-info add-metadata \
    --metadata google-compute-default-region=us-east4,google-compute-default-zone=us-east4-c
    ```

1. To create VM

    * List machine-types
        ```console
        gcloud compute machine-types list  --filter="zone:(us-east4-c)"
        ```
        * Search:
            * e2-standard-2
            * e2-standard-4
        
    * List images
        ```console
        gcloud compute images list
        ```
        * Search:
            * centos-8-v20201216

    * Create VM
        ```console
        gcloud compute instances create srvk8sdev \
        --image centos-8-v20201216 \
        --machine-type e2-standard-4 \
        --image-project centos-cloud \
        --tags dockerserver,k8s,allowhttp
        ```

1. Crear keypairs
    ```console
    ssh-keygen -f ./credentials/educaKeys -t rsa -b 4096 -m PEM
    chmod 400 ./credentials/educaKeys
    ```

1. Login VM
    ```console
    ssh -i ./credentials/educaKeys mzegarra@34.68.209.230
    ```

