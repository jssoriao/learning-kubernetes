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
