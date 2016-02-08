FROM ubuntu:14.04

# Use root user
USER root
ENV DEBIAN_FRONTEND=noninteractive

# File Author / Maintainer
MAINTAINER Quinton Pike

# Install packages:
RUN apt-get update && apt-get install isc-dhcp-server -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN touch /var/lib/dhcp/dhcpd.leases

VOLUME ["/etc/dhcp/"]

CMD ["dhcpd", "-f"]