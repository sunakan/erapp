DOCKER_IMAGE=sunakan/erapp
RUBY_VERSION_TAG=2.6-slim

export DOCKER_IMAGE
export RUBY_VERSION_TAG

build:
	DOCKER_IMAGE=${DOCKER_IMAGE} bash ./build-deploy/build.sh

run:
	docker run --publish 4567:4567 ${DOCKER_IMAGE}:latest

up:
	docker-compose up

bash:
	docker-compose run --service-ports app bash
