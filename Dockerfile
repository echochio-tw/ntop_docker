FROM debian:wheezy
RUN apt-get -y update && apt-get -y upgrade -uV
RUN apt-get -y install libtool automake autoconf make build-essential python-dev subversion wget
RUN apt-get -y install libpcap-dev libgdbm-dev zlib1g-dev libgeoip-dev libgraphviz-dev graphviz rrdtool librrd-dev
WORKDIR /tmp
RUN wget http://sourceforge.net/projects/ntop/files/ntop/Stable/ntop-5.0.1.tar.gz
RUN tar xvfz ntop-5.0.1.tar.gz
WORKDIR /tmp/ntop-5.0.1
RUN sh ./autogen.sh && make && make install
RUN useradd -r -s /bin/false ntop
RUN chown -R ntop:ntop /usr/local/share/ntop /usr/local/lib/ntop /usr/local/var/ntop
RUN /sbin/ldconfig
RUN mkdir /usr/local/var/ntop/rrd ; chown -R ntop /usr/local/var/ntop/rrd/
RUN ln -s /usr/bin/dot /usr/local/bin/dot
RUN echo 'LOCAL="$Local"' > /run.sh ;\
    echo 'ntop -cd -i none -u ntop -W 0.0.0.0:3001 -m $LOCAL &' >> /run.sh ;\
    echo 'while true; do'  >> /run.sh ;\
    echo 'sleep 5' >> /run.sh ;\
    echo 'done' >> /run.sh
RUN  chmod +x /run.sh
ENTRYPOINT /run.sh
