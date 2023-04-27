FROM ubuntu:20.04
ENV TZ=Asia/Dubai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -y apache2
RUN rm /var/www/html/index.html
COPY index.html /var/www/html/
RUN service apache2 restart
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
