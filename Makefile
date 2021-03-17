FILE="temp-compose.yml"
CONF="lb.tmp.conf"

run: generate_docker_compose generate_nginx_conf
	docker-compose -f ${FILE} up -d

generate_docker_compose:
	python ./scripts/generate_docker_compose.py ${workers} > ${FILE}

generate_nginx_conf:
	python ./scripts/generate_nginx_conf.py ${workers} > ${CONF}

clean:
	docker-compose -f ${FILE} down
