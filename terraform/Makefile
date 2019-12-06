WORKING_DIR=/app

ash:
	DIR=${DIR} ENTRYPOINT="" docker-compose run --rm tf ash
v:
	ENTRYPOINT=terraform docker-compose run --rm tf -v
init:
	WORKING_DIR=${WORKING_DIR} ENTRYPOINT=terraform DIR=${DIR} docker-compose run --rm tf init
get:
	WORKING_DIR=${WORKING_DIR} ENTRYPOINT=terraform DIR=${DIR} docker-compose run --rm tf get
fmt:
	WORKING_DIR=${WORKING_DIR} ENTRYPOINT=terraform DIR=${DIR} docker-compose run --rm tf fmt -recursive
plan:
	WORKING_DIR=${WORKING_DIR} ENTRYPOINT=terraform DIR=${DIR} docker-compose run --rm tf plan ${ARGS}
apply:
	WORKING_DIR=${WORKING_DIR} ENTRYPOINT=terraform DIR=${DIR} docker-compose run --rm tf apply ${ARGS}
destroy:
	WORKING_DIR=${WORKING_DIR} ENTRYPOINT=terraform DIR=${DIR} docker-compose run --rm tf destroy
