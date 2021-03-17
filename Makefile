FILE="temp-compose.yml"

run: generate_docker_compose
	docker-compose -f ${FILE} up -d

generate_docker_compose:
	python ./scripts/generate_docker_compose.py ${workers} > ${FILE}
