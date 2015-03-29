FROM apache-simple

MAINTAINER Gerd Aschemann <gerd@aschemann.net>

# COPY apache-run.sh /

RUN mkdir -p /var/www/html; \
  ( date; echo good evening frankfurt ) > /var/www/html/index.html
  
# ENTRYPOINT /apache-run.sh

CMD /usr/sbin/apache2ctl start; while true; do ps auxww > /dev/console; netstat -anp > /dev/console; date > /dev/console; sleep 2; done
  
EXPOSE 80
