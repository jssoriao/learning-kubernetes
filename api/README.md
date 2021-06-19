## Use local docker image in minikube

To use a local image, load it inside minikube.

```bash
minikube image load my-image
```

Set the `imagePullPolicy` to Never, otherwise Kubernetes will try to download the image.

```yaml
    ...
    spec:
      containers:
        - name: <my-pod>
          image: <my-image>
          imagePullPolicy: Never
```

## Connect to Linode Kubernetes cluster with kubectl

Download the kubeconfig file from Linode. Set the path of the downloaded yaml file as the value of the environment variable KUBECONFIG

```bash
export KUBECONFIG=<path_to_kubeconfig_yaml_file>
```
