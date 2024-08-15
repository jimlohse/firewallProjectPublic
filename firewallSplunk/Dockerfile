FROM ubuntu:22.04

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get -y install file curl wget software-properties-common gnupg2 git net-tools zip vim iproute2 iputils-ping

# Install Splunk Forwarder
RUN wget -O splunkforwarder-9.3.0-51ccf43db5bd-linux-2.6-amd64.deb "https://download.splunk.com/products/universalforwarder/releases/9.3.0/linux/splunkforwarder-9.3.0-51ccf43db5bd-linux-2.6-amd64.deb"

# create a user account and dir first
RUN useradd -m splunkfwd
# apparently not needed
# RUN groupadd splunkfwd
# RUN export SPLUNK_HOME="/opt/splunkforwarder" && mkdir $SPLUNK_HOME
RUN mkdir /opt/splunkforwarder

RUN dpkg -i splunkforwarder-9.3.0-51ccf43db5bd-linux-2.6-amd64.deb

ADD inputs.conf /opt/splunkforwarder/etc/system/local/inputs.conf
ADD outputs.conf /opt/splunkforwarder/etc/system/local/outputs.conf
ADD users.ini /opt/splunkforwarder/etc/users/users.ini
ADD startupSplunk.sh /tmp/startupSplunk.sh
RUN chmod +x /tmp/startupSplunk.sh

RUN chown -R splunkfwd:splunkfwd /opt/splunkforwarder

USER splunkfwd
ENTRYPOINT ["/tmp/startupSplunk.sh"]

# CMD ["bash"]
