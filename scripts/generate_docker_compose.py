import sys

REPLICAS = 1
if len(sys.argv) > 1:
   REPLICAS = int(sys.argv[1])

Header="""version: "3"
services:
"""

Server="""  server%d:
    build: ./server
    hostname: 'worker%d'
    environment:
      - PORT=80
    depends_on:
      - redis
"""

Footer="""  redis:
    image: redis
  lb:
    image: nginx
    ports:
      - "8080:80"
    volumes:
      - ${PWD}/conf:/etc/nginx/conf.d
    depends_on:
"""

LB_dependency="""      - server%d
"""
finalString = Header
for i in range(0,REPLICAS):
    finalString += Server % (i+1, i+1)

finalString += Footer

for i in range(0,REPLICAS):
    finalString += LB_dependency % (i+1)

print(finalString)

