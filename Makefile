
### DEV COMMANDS ###

docker_init:
	docker-machine start $(mach)
	docker-machine env $(mach)

build:
	docker build -t michaelconnor/flask-oauth2 .

rundev:
	docker run -it -v $(CURDIR):/webapp \
	-p 8001:8001 \
	-p 5000:5000 \
	--name oauth michaelconnor/flask-oauth2

killdev:
	docker stop oauth
	docker rm oauth

clean:
	docker ps -a -q | xargs docker rm
	docker images | grep "^<none>" | awk '{print $$3}' | xargs docker rmi