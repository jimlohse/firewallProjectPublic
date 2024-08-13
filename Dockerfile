# For more information, please refer to https://aka.ms/vscode-docker-python
FROM ubuntu:22.04

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install curl wget software-properties-common gnupg2 git net-tools zip vim
RUN apt-get -y install iproute2 iputils-ping

RUN apt-get -y install iptables

RUN apt-get install build-essential libpcap-dev libpcre3-dev libnet1-dev zlib1g-dev luajit \
    hwloc libdnet-dev libdumbnet-dev bison flex liblzma-dev openssl libssl-dev pkg-config \
    libhwloc-dev cmake cpputest libsqlite3-dev uuid-dev libcmocka-dev libnetfilter-queue-dev \
    libmnl-dev autotools-dev libluajit-5.1-dev libunwind-dev libfl-dev  ethtool -y 

RUN git clone https://github.com/snort3/libdaq.git

RUN cd libdaq && autoreconf -if
RUN cd libdaq && ./configure
RUN cd libdaq && make
RUN cd libdaq && make install

RUN cd && wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.15/gperftools-2.15.tar.gz

RUN cd && tar xzf ./gperftools-2.15.tar.gz
RUN cd ~/gperftools-2.15 && ./configure
RUN cd ~/gperftools-2.15 && make
RUN cd ~/gperftools-2.15 && make install

RUN wget https://github.com/snort3/snort3/archive/refs/tags/3.1.43.0.tar.gz
RUN tar -xzf 3.1.43.0.tar.gz
RUN cd snort3-3.1.43.0 && ./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc

RUN cd snort3-3.1.43.0/build && make
RUN cd snort3-3.1.43.0/build && make install
RUN ldconfig

# RUN cd ~ && wget https://www.snort.org/downloads/community/snort3-community-rules.tar.gz
# RUN mkdir -p /usr/local/etc/rules && cd /usr/local/etc/rules && tar xzf ~/snort3-community-rules.tar.gz 

# RUN wget https://www.snort.org/downloads/community/community-rules.tar.gz -O community-rules.tar.gz
# RUN tar -xvf community-rules.tar.gz

ADD community-rules/community.rules /etc/snort/rules/community.rules
ADD snort.lua /etc/snort/snort.lua
ADD snort_defaults.lua /etc/snort/snort_defaults.lua
ADD community-rules/white_list.rules /etc/snort/rules/white_list.rules
ADD community-rules/black_list.rules /etc/snort/rules/black_list.rules
ADD community-rules/file_magic.rules /etc/snort/rules/file_magic.rules
ADD cs6035.rules /etc/snort/rules/cs6035.rules
ADD emerging3 /etc/snort/rules/emerging3

RUN mkdir -p /var/log/snort && touch /var/log/snort/alert_fast.txt

ADD startup.sh /root/startup.sh
RUN chown root:root /root/startup.sh
ENTRYPOINT ["/root/startup.sh"]



# RUN /usr/local/bin/snort -c /usr/local/etc/snort/snort.lua -s 65535 -k none -l /var/log/snort -D -i eth0 -m 0x1b -u root -g root
# RUN snort -T -c /etc/snort/snort.conf
#CMD ["snort", "-q", "-c", "/etc/snort/snort.conf", "-i", "eth0"] 
# , "--daq-batch-size", "1"]

# CMD ["bash"]
# full startup command:
# /usr/local/bin/snort -c /usr/local/etc/snort/snort.lua -s 65535 -k none -l /var/log/snort -D -i eth0 -m 0x1b -u root -g root
# CMD ["/usr/local/bin/snort", "-c", "/usr/local/etc/snort/snort.lua", "-s", "65535", "-k", \
#     "none", "-l", "/var/log/snort", "-D", "-i", "eth0", "-m", "0x1b", "-u", "root", "-g", "root"]

