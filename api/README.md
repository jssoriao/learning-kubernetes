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

## Create k8s secret for the private registry credentials

Use kubectl to create the secret or use a yaml file.

```bash
kubectl create secret generic <secret_name> \
--from-file=.dockerconfigjson=.docker/config.json \
--type=kubernetes.io/dockerconfigjson
```

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: <secret_name>
type: kubernetes.io/dockerconfigjson
data:
  .dockerconfigjson: <base64_encoded_docker_config_file>
```

Running the `kubectl create secret` command will automatically run base64 the contents of the docker config file. Else, use the bash base64 command

```bash
base64 <infile>
```

We can also create a secret without an existing docker config file.

```bash
kubectl create secret docker-registry <secret_name> \
--docker-server=<your-registry-server> \
--docker-username=<your-name> \
--docker-password=<your-pword> \
--docker-email=<your-email>
```
