## Namespace/s

Install kubectx which also includes kubens. This tool helps in managing kubernetes namespaces.

```bash
# List all namespaces
kubens
# Change active namespace
kubens <your_namespace>
```

## Mapping ingress host to IP address

Open the `/etc/hosts` file with a text editor then create the mapping from the ingress IPv4 address to the hostname.

```text
...
192.168.99.101  mongoexpress.com
```
