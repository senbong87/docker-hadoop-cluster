run: build-hadoop
	docker-compose up

build-hadoop:
	docker build -t hadoop:base -f hadoop/Dockerfile hadoop
