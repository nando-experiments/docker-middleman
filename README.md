# Docker middleman

Clone repo and update submodules:

```
$ git clone https://github.com/nandomoreirame/docker-middleman.git
$ git submodule update --remote --merge --init
```

Build docker image:

```
$ docker-compose build
```

To start the service:

```
$ docker-compose up -d
```

To shutdown one container:

```
$ docker-compose down
```

- OR -

```
$ docker-compose kill
```
