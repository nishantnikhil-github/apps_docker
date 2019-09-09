FROM centos:7




# Build commands
RUN yum swap -y fakesystemd systemd && \
    yum install -y systemd-devel
RUN yum install -y python-setuptools mysql-connector-python mysql-devel gcc python-devel git httpd-server httpd-devel httpd postfix cronie crontabs
RUN easy_install pip
RUN mkdir /opt/hello_app
RUN mkdir /opt/hello_app/cgi-bin
RUN mkdir /opt/hello_app/www
WORKDIR /opt/hello_app
ADD httpd.conf /opt/hello_app/
ADD cgi-bin /opt/hello_app/
ADD run-httpd.sh /opt/hello_app/
ADD requirements.txt /opt/hello_app/
RUN pip install -r requirements.txt
ADD . /opt/hello_app

ENV http_proxy=""
ENV https_proxy=""


RUN mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.orig
RUN cp /opt/hello_app/httpd.conf /etc/httpd/conf/httpd.conf
RUN cp /opt/hello_app/run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
EXPOSE 80
#CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
CMD ["/run-httpd.sh"]
 


