This project is to simulate live status of all activities during ongoing deployment

Data Storage
Mongo DB (Docker Container)

docker run --name dtmongo -v $(PWD)/dtmongo:/data/db -p 27017:27017 -d mongo:3.4 --auth

Add the Initial Admin User
docker exec -it dtmongo mongo admin
db.createUser({ user: 'dtuser', pwd: 'changeme', roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] });



#How to set up python Docker container
We will use the Dockerfile provided in this directory.
Build docker image
docker build -t kd/mypy:latest .

#Mount program directory and run disposable container in interactive mode
docker run --rm -it -v $(PWD):/data kd/mypy:latest /bin/bash


#Set up httpd Docker Container
#Pay attention to volumes that you mount in below command
docker run --name dthttpd -v $(PWD):/usr/local/apache2/htdocs -P -d httpd:2.4

Note - For high availability, you can run httpd as Docker service (Docker 1.12 + required)
docker swarm init
sudo docker service create --mount type=bind,src=/path/to/deployment_status/UI,dst=/usr/local/apache2/htdocs --name deployment_status --replicas=10 -p 8080:80 httpd:2.4

