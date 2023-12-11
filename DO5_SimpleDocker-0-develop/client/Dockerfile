FROM nginx:latest



RUN apt update && apt upgrade -y && rm -rf /var/lib/apt/lists

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./server.sh  /

RUN chmod g-s /usr/bin/expiry &&\
    chmod g-s /usr/bin/chage &&\
    chmod g-s /sbin/unix_chkpwd &&\
    chmod g-s /usr/bin/wall &&\
    chmod u-s /usr/bin/passwd &&\
    chmod u-s /usr/bin/chfn &&\
    chmod u-s /bin/umount &&\
    chmod u-s /bin/su &&\
    chmod u-s /bin/mount &&\
    chmod u-s /usr/bin/gpasswd &&\
    chmod u-s /usr/bin/newgrp &&\
    chmod u-s /usr/bin/chsh

CMD ["nginx", "-g", "daemon off;"]

RUN useradd -m -s /bin/bash -G nginx s21 && chown -R s21:s21 /etc/nginx

RUN chgrp -R s21 /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 777 /var/cache/nginx /var/run /var/log/nginx




USER s21

ENTRYPOINT ["./server.sh"]


HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:8080/ || exit 1