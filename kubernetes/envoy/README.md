# Learning envoy

## Simple external proxy test

```
$ vagrant ssh master
$ nohup envoy -c /vagrant/envoy/envoy-google.yaml &
$ curl -v localhost:10000
```
