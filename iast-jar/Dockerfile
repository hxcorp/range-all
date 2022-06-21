FROM centos:7
WORKDIR /opt
COPY . .
RUN yum -y install yum -y install *epel* \
    && yum -y localinstall http://mirrors.ustc.edu.cn/mysql-repo/mysql57-community-release-el7.rpm \
    && yum -y install mysql-community-server net-tools lsof jq git java-1.8.0-openjdk* --nogpgcheck && chmod +x ./entrypoint.sh
CMD bash entrypoint.sh ${IASTIP} ${TOKEN} ${ProjectName}
