FROM ubuntu:18.04
USER root
RUN apt-get update -y && apt-get install -y openjdk-8-jdk
ENV Java_home /usr/lib/jvm/java-1.8.0-openjdk-amd64
ADD apache-tomcat-9.0.65.tar.gz /opt/
RUN mv /opt/apache-tomcat-9.0.65 /opt/tomcat
RUN chmod -R 777 /opt/tomcat
EXPOSE 8080
COPY gameoflife.war /opt/tomcat/webapps/
CMD ["/opt/tomcat/bin/catalina.sh","run"]
