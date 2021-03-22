FILE="temp-compose.yml"
CONF="conf/lb.tmp.conf"

build:
	docker-compose -f ${FILE} build

run: generate_docker_compose generate_nginx_conf build 
	docker-compose -f ${FILE} up -d

generate_docker_compose:
	python ./scripts/generate_docker_compose.py ${workers} > ${FILE}

generate_nginx_conf:
	mkdir -p conf && python ./scripts/generate_nginx_conf.py ${workers} > ${CONF}

modify:
	sed -i 's/\(server${worker}:80 weight=\)[0-9]\+/\1${weight}/' ./conf/lb.tmp.conf
	docker-compose -f ${FILE} exec lb nginx -s reload

clean:
	docker-compose -f ${FILE} down --remove-orphans
	rm -rf ./conf ./temp-compose.yml

test:
	 for i in `seq 1 ${count}`; do curl -s localhost:8080 >> /tmp/test.txt; done; cat /tmp/test.txt | sort | uniq -c; rm -f /tmp/test.txt
