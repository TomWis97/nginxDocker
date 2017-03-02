FROM centos:latest
RUN yum install epel-release -y && \
    yum install nginx gcc -y && \
    mkdir /var/www
RUN mkdir /var/uwsgi && curl http://uwsgi.it/install | bash -s cgi /usr/bin/uwsgi && mkdir /usr/lib/cgi-bin
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/index.html
COPY uwsgi_config.ini /etc/uwsgi_config.ini
COPY index.py /usr/lib/cgi-bin/index.py
EXPOSE 80
CMD /usr/bin/uwsgi /etc/uwsgi_config.ini & /usr/sbin/nginx -c /etc/nginx/nginx.conf
