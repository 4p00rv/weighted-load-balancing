import sys

REPLICAS = 1
if len(sys.argv) > 1:
   REPLICAS = int(sys.argv[1])

Header="""version: "3"
services:
"""

Server="""  server%d:
    build: ./server
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
      - ./lb.tmp.conf:/etc/nginx/conf.d/default.conf
"""
finalString = Header
for i in range(0,REPLICAS):
    finalString += Server % i

finalString += Footer
print(finalString)

