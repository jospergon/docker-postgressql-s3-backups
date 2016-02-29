FROM ubuntu:15.10

RUN apt-get update -qq
RUN apt-get install -y postgresql-client-9.4 cron wget

RUN wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | apt-key add -
RUN wget http://s3tools.org/repo/deb-all/stable/s3tools.list -O /etc/apt/sources.list.d/s3tools.list
RUN apt-get install -y s3cmd

ADD crontab /etc/crontab

ADD s3cfg /.s3cfg
ADD run.sh /run.sh

ADD backups.sh /backups.sh

VOLUME ["/var/log/"]
RUN touch /var/log/cron.log

RUN chmod u+x /run.sh
RUN chmod u+x /backups.sh

ENTRYPOINT ["/run.sh"]

#CMD ["sh", "run.sh"]
