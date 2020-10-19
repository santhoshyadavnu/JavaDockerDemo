FROM tomcat:8.5
MAINTAINER Santhosh Yadav <santhoshyadavnu@gmail.com>

# Debugging tools: A few ways to handle debugging tools.
# Trade off is a slightly more complex volume mount vs keeping the image size down.
RUN apt-get update && \
  apt-get install -y \
    net-tools \
    tree \
    vim && \
  rm -rf /var/lib/apt/lists/* && apt-get clean && apt-get purge

RUN echo "export JAVA_OPTS=\"-Dapp.env=staging\"" > /usr/local/tomcat/bin/setenv.sh
COPY target/demo.war /usr/local/tomcat/webapps/demo.war

EXPOSE 8081
CMD ["catalina.sh", "run"]
