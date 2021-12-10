FROM ubi8/ubi:8.3

MAINTAINER Bruno Frigo Volpini <brunovolpini7@gmail.com>

LABEL description="A custom Apache container based on UBI 8"

RUN yum install -y httpd && \
    yum clean all

RUN echo "Hello from RM341279" > /var/www/html/index.html

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]