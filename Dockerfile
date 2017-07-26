FROM alpine:latest

RUN apk add --update nginx && rm -rf /var/cache/apk/* \
	&& mkdir -p /tmp/nginx/client-body && mkdir -p /var/www/

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY src /var/www/

CMD ["nginx", "-g", "daemon off;"]

