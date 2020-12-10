# Apache in a Docker with Supervisor (CentOS 7 & Alpine)

### Environmental Variable

|Variable|DefaultSettings|Info|
|:--|:--|:--|
|`LOG_LEVEL`|`info`|Specify log level Apache should when started. [Apache Log Levels](https://httpd.apache.org/docs/2.4/mod/core.html#loglevel)|
|`DEFAULT_CONFIG`|`true`|Use default config provided by Apache package - Change to `false` when using custom config|

### Usage

#### Basic

    docker run \
      -d \
      --name httpd \
      -p 80:80 \
      polinux/httpd

#### Set log level to debug

    docker run \
      -d \
      --name httpd \
      -p 80:80 \
      -e LOG_LEVEL="debug" \
      polinux/httpd

### Build

    docker build -t polinux/httpd .

Docker troubleshooting
======================

Use docker command to see if all required containers are up and running:
```
$ docker ps
```

Check logs of httpd server container:
```
$ docker logs httpd
```

Sometimes you might just want to review how things are deployed inside a running
 container, you can do this by executing a _bash shell_ through _docker's
 exec_ command:
```
docker exec -ti httpd /bin/bash
```

History of an image and size of layers:
```
docker history --no-trunc=true polinux/httpd | tr -s ' ' | tail -n+2 | awk -F " ago " '{print $2}'
```
