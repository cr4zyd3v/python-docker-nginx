FROM nginx:1.17.8-alpine

ADD ./compose/production/nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./compose/production/nginx/service-django.conf /etc/nginx/conf.d/service-django.conf

ADD ./compose/production/nginx/entrypoint.sh /entrypoint.sh
ADD ./compose/production/nginx/le.sh /le.sh

RUN \
 rm /etc/nginx/conf.d/default.conf && \
 chmod +x /entrypoint.sh && \
 chmod +x /le.sh && \
 apk add  --update certbot tzdata openssl && \
 rm -rf /var/cache/apk/*

CMD ["/entrypoint.sh"]

