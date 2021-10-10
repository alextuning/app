IMPORTANT! App has no it's own registry so Docker image should be build locally
```
docker build -t app:latest .
```

and chart yaml should be edit accordingly:

```
vi Chart.yaml
...
sources:
  - git@github.com:alextuning/app.git
```


## Installation

```
    $ helm install . __NAME__
```

## Usage
To get companies list
```
    curl http://<IP>:5000/companies
```
