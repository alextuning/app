IMPORTANT! App has no it's own public registry so Docker image should be build locally and pushed to your own registry
```
docker build -t app:0.0.1 .
```

then change Chart.yaml accordingly:

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
