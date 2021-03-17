import sys

REPLICAS=int(sys.argv[1]) or 1

Upstream = """upstream web {
%s}
"""
Server = """    server server%d:80 weight=10;
"""

Footer = """
server {
  listen 80 default;
  server_name localhost;
  charset UTF-8;

  location / {
    proxy_pass http://web;
  }
}
"""

servers = ''
for i in range(0,REPLICAS):
    servers += Server % i

finalString = (Upstream % servers) + Footer

print(finalString)
