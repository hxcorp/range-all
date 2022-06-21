FROM centos:7
WORKDIR /opt
ADD https://download.java.net/java/GA/jdk16/7863447f0ab643c585b9bdebf67c69db/36/GPL/openjdk-16_linux-x64_bin.tar.gz .
ADD https://github.com/WebGoat/WebGoat/releases/download/v8.2.2/webgoat-server-8.2.2.jar .
COPY .webgoat-8.2.2  ~/
COPY . .
RUN yum -y install yum -y install *epel* \
    && yum -y install net-tools lsof jq --nogpgcheck && chmod +x ./entrypoint.sh
CMD bash entrypoint.sh ${IASTIP} ${TOKEN} ${ProjectName}
