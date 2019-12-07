DOCKER_IMAGE=sunakan/erapp
RUBY_VERSION_TAG=2.6-slim
AWS_ECR_REPO_NAME=sunakan/erapp

export DOCKER_IMAGE
export RUBY_VERSION_TAG
export AWS_ECR_REPO_NAME

login:
	aws ecr get-login --no-include-email | sh

build:
	bash ./build-deploy/build.sh

deploy: login
	bash ./build-deploy/build.sh | tail -1 | bash ./build-deploy/push-to-ecr.sh

run:
	docker run --publish 4567:4567 ${DOCKER_IMAGE}:latest

up:
	docker-compose up

bash:
	docker-compose run --service-ports app bash
