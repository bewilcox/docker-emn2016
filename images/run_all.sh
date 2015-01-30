#!/bin/sh

sudo docker run -d --name app1 demo/apache-app
sudo docker run -d --name app2 demo/apache-app
sudo docker run -d -p 80:80 --name haproxy --link app1:host1 --link app2:host2 demo/haproxy
