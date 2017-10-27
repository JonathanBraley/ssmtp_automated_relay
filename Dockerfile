FROM debian:stretch-slim
MAINTAINER Jonathan-b

#let's install ssmtp, mailutils, supervisor
RUN apt-get update && apt-get install -y ssmtp mailutils

#we link sendmail to ssmtp
RUN ls -la /usr/sbin/sendmail

#we add our conf files
COPY assets/ssmtp.conf /etc/ssmtp/
COPY assets/install.sh /
RUN chmod +x /install.sh

#Run
ENTRYPOINT ["/install.sh"]
