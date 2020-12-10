FROM centos:7

MAINTAINER Fenei <babyfenei@qq.com>

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VERSION
LABEL build_version="babyfenei/docker-httpd version:- ${VERSION} Build-date:- ${BUILD_DATE}"


ENV LOG_LEVEL="info" \
    DEFAULT_CONFIG="true"



RUN curl -o /etc/yum.repos.d/CentOS-Base.repo -O http://mirrors.aliyun.com/repo/Centos-7.repo && \
    yum install -y epel-release

RUN yum install -y \
    iproute python-setuptools hostname inotify-tools yum-utils which jq && \
    easy_install supervisor

RUN yum install -y \
    httpd  php php-gmp php-opcache php-devel php-mbstring php-mcrypt php-mysql php-phpunit-PHPUnit \
    php-gd php-xml  php-ldap php-mbstring php-mcrypt php-pecl-xdebug php-pecl-xhprof php-opcache php-pecl-redis php-redis \
    php-pecl-xdebug php-pecl-xhprof php-snmp vim ntpdate wget  lsof && \
  yum clean all && rm -rf /var/cache/yum

ADD container-files /

EXPOSE 80 443

ENTRYPOINT ["/config/bootstrap.sh"]
