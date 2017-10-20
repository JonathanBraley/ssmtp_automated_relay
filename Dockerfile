FROM debian:stretch-slim
MAINTAINER Jonathan-b

#Check if image is up to date.
RUN apt-get update && apt-get upgrade

#let's install ssmtp and mailutils
RUN apt-get install -y ssmtp mailutils

#we link sendmail to ssmtp
ls -la /usr/sbin/sendmail

#we add our conf files
ADD assets/ssmtp.conf /etc/ssmtp/ssmtp.conf
ADD assets/install.sh ~/install.sh

#Run
CMD ~/install.sh
