# Heroes
This is an Angular application.

# References
- [Angular](https://angular.io/tutorial/tour-of-heroes "tour of heroes")

# Prerequisites
- Make sure **Docker** is installed. [Docker](https://www.docker.com/ "Docker")
- Make sure **Node** is installed. [Node.js](https://nodejs.org/en)
- Make sure **Angular** Cli is installed. [Angular Cli](https://angular.io/cli)
# How to setup the project

1. Clone the project
```sh
$ git clone https://github.com/CyrilBaah/Heroes.git
```
2. Change the directory
```sh
$ cd heroes
```
3. Run
```sh
$ npm install
```
4. Run
```sh
$ ng serve
```

# Start project with docker
1. Run
```sh
$ docker build -t heroes .
```
2. Run
```sh
$ docker run -p 8080:80 heroes
```
3. Access URL on [Link](http://127.0.0.1:8080) 


# Create Kubernetes with Kind

## Create a cluster
```sh
$ kind create cluster --name=heroes-cluster
```
## Delete all cluster
```sh
$ kind delete clusters --all
```

## Delete a cluster
```sh
$ kind delete cluster --name=heroes-cluster
```

## Create a cluster with custom configuration
```sh
$ kind create cluster --config=workerNodes.yml
```

## Get service URL

```sh
$ minikube service heroes-service --url
```

## Generate self-signed certificate | OpenSSL certificate
```sh
$ openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.crt -subj "/CN=heroes-tour.com" -days 365
```
## Apply SSL certificate
```sh
$ kubectl create secret tls heroes-tour-com --cert tls.crt --key tls.key
```
