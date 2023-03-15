FROM ubuntu:22.04
SHELL ["/bin/bash", "-l", "-c"]
COPY unbound.conf /usr/local/etc/unbound/unbound.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN apt-get update && apt-get install -y git gcc iputils-ping iproute2 libssl-dev libexpat-dev build-essential vim sudo dnsutils libevent-dev tcpdump bison byacc
# RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN git clone https://github.com/momoka0122y/dns.git unbound
RUN bash -c "pushd /unbound && ./configure && make && sudo make install && popd"
RUN useradd unbound
# RUN sudo resolvconf -u 
COPY resolv.conf /etc/resolv.conf
EXPOSE 53/udp
ENTRYPOINT ["/entrypoint.sh"]
