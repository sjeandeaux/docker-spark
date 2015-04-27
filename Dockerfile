FROM centos:latest

MAINTAINER Stéphane Jeandeaux <stephane.jeandeaux@gmail.com>

#Install JAVA
RUN curl http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.rpm -L -C - -b "oraclelicense=accept-securebackup-cookie" -o /tmp/jdk.rpm
RUN rpm -ivh /tmp/jdk.rpm \
   && rm -f /tmp/jdk.rpm

RUN yum -y install tar

#Install Spark
RUN curl http://d3kbcqa49mib13.cloudfront.net/spark-1.3.1-bin-cdh4.tgz -L -C - -o /tmp/spark.tgz
RUN tar --strip-components 1 -zxf /tmp/spark.tgz -C /usr/local/ \
    && rm /tmp/spark.tgz  

RUN yum -y remove tar

#where you put your jar
VOLUME /var/lib/job

#GO...
ENTRYPOINT ["spark-submit"]
CMD ["--help"]
