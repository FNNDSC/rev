FROM ubuntu:latest
MAINTAINER fnndsc "dev@babymri.org"

RUN apt update \ 
&& apt-get install -y git \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 php7.2

RUN cd /var/www/html/ \
&& git clone https://github.com/FNNDSC/rev.git

RUN cd /var/www/html/ \
&& mv rev/_h5aisrc ./_h5ai \ 
&& mv index.html index.apache.html \
&& echo "DirectoryIndex  index.html  index.php  /_h5ai/public/index.php" >> /etc/apache2/apache2.conf

CMD apache2ctl -D FOREGROUND