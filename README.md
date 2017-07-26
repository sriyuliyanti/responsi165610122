langkah pembuatan images :

1.	Buat folder dengan cara : mkdir 165610122
2.	Download konfigurasi nginx dan letakkan pada folder yang telah dibuat
3.	Buat dockerfile dengan cara ketik :
vi Dockerfile

Isi Dockerfile

FROM alpine:latest
RUN apk add --update nginx && rm -rf /var/cache/apk/* \
	&& mkdir -p /tmp/nginx/client-body && mkdir -p /var/www/
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY src /var/www/
CMD ["nginx", "-g", "daemon off;"]

4.	Buat folder baru dengan nama src dan buat index.html dan readme.md

5.	Build dockerfile, dengan perintah sbb :
docker build -t responsi165610122 .
6. Jalankan container dengan perintah
docker run -d -p 80:80 responsi165610122

7. Buka browser, ketikan IP public : 192.168.99.100
 
8.	Buat docker compose dengan ketik : vi docker-compose.yml
isi docker compose
version: '2'
services:
        web:
            image: responsi165610122
            ports:
                 - "80:80"
            volumes:
                 - ".src:/usr/share/nginx/html"

9.	Jalankan docker compose
docker-compose up –d
10.	Untuk menjalankan 
Buka browser http://192.168.99.100

11. UPLOAD image ke docker hub
-	docker login
-	docker tag responsi165610122 sriyuliyan/responsi165610122 
-	docker push sriyuliyan/responsi165610122

12. UPOLOAD Ke Github dengan membuat respositori baru
