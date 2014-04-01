# DynamoDB Local
FROM ubuntu:12.10
MAINTAINER Matt Carrier @icecreammatt

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java 
RUN apt-get update
RUN apt-get install -y oracle-java7-installer curl
RUN apt-get upgrade -y

RUN mkdir /app
RUN /usr/bin/curl -L http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest | /bin/tar -xz -C /app

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=/app/dynamodb_local_2014-01-08/DynamoDBLocal_lib", "-jar", "/app/dynamodb_local_2014-01-08/DynamoDBLocal.jar"]

EXPOSE 8000
