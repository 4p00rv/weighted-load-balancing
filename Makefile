FILE="temp-compose.yml"
CONF="conf/lb.tmp.conf"

build:
	docker-compose -f ${FILE} build

run: generate_docker_compose generate_nginx_conf build 
	docker-compose -f ${FILE} up -d

generate_docker_compose:
	python ./scripts/generate_docker_compose.py ${workers} > ${FILE}

generate_nginx_conf:
	python ./scripts/generate_nginx_conf.py ${workers} > ${CONF}

clean:
	docker-compose -f ${FILE} down
	rm -rf ./conf ./temp-compose.yml
