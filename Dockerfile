FROM ubuntu:trusty
MAINTAINER ASCDC <asdc.sinica@gmail.com>

ADD run.sh /run.sh

RUN DEBIAN_FRONTEND=noninteractive && \
	chmod +x /*.sh && \
	apt-get update && \
	apt-get -y install build-essential git && \
	locale-gen en_US.UTF-8 && \
	export LANG=en_US.UTF-8 && \
	mkdir /crfpp
RUN DEBIAN_FRONTEND=noninteractive && apt-get update && \
	apt-get -y upgrade && \
	git clone https://github.com/taku910/crfpp.git /crfpp && \
	cd /crfpp && \
	/crfpp/configure && \
	make && \
	make install

EXPOSE 80
WORKDIR /crfpp
ENTRYPOINT ["/run.sh"]