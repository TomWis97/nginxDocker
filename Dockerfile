FROM centos:latest
RUN yum install epel-release -y && \
    yum install nginx gcc -y && \
    mkdir /var/www
RUN yum install -y python34 python34-devel uwsgi-plugin-python3
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/index.html
COPY uwsgi_config.ini /etc/uwsgi_config.ini
COPY index.py /usr/lib/cgi-bin/index.py
COPY index.py /usr/lib/cgi-bin/index.html
EXPOSE 80
CMD /usr/sbin/uwsgi /etc/uwsgi_config.ini & /usr/sbin/nginx -c /etc/nginx/nginx.conf
