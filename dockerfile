FROM pihole/pihole@sha256:650c707aa18b7a0145e87ef00b278ee5184012d255b9df9f5dad171f4bd09719
RUN apt update
RUN apt upgrade -y
RUN mkdir /cp-pihole
RUN mkdir /cp-pihole/html
ADD ./cp-pihole/setup.sh /cp-pihole/setup.sh
ADD ./cp-pihole/15-pihole-admin.conf /cp-pihole/15-pihole-admin.conf
RUN chmod +x /cp-pihole/setup.sh
RUN ./cp-pihole/setup.sh