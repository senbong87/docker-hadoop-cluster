run: build-hadoop
	docker network create hadoop
	docker-compose up

build-hadoop:
	docker build -t hadoop:base -f hadoop/Dockerfile hadoop
