build:
	docker build \
	--tag sunakan/erapp:latest \
	--build-arg RUBY_VERSION_TAG=2.6-slim \
	.

run:
	docker run --publish 4567:4567 sunakan/erapp:latest

up:
	docker-compose up

bash:
	docker-compose run --service-ports app bash
